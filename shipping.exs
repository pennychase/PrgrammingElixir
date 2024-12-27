defmodule ShippingCost do

  def calculate_orders(path) do
    read_orders(path) |> add_sales_tax([NC: 0.075, TX: 0.08])
  end

  def add_sales_tax(orders, rates) do
    Enum.map(orders, &total_amount(&1, rates))
  end

  def total_amount(order, rates) do
    state = Keyword.get(order, :ship_to)
    tax = Keyword.get(rates, state, 0.00)
    Keyword.put_new(order, :total_amount, Float.round(order[:net_amount]+tax, 3))
  end

  def read_orders(path) do
    case File.open(path) do
      {:ok, file} ->
        keys = IO.read(file, :line) |> String.trim |> String.split(",") |> Enum.map(&String.to_atom(&1))
        orders = Enum.map(IO.stream(file, :line), &make_order(&1, keys))
        File.close(file)
        orders
      {:error, message} -> "Failed to open #{path}: #{message}"
    end
  end

  def make_order(order, keys) do
    data = order |> String.trim |> String.split(",") |> Enum.map(&convert(&1))
    Enum.zip(keys, data)
  end

  def convert(str) do
    cond do
      String.match?(str, ~r/\d+\.\d+/) -> String.to_float(str)
      String.match?(str, ~r/\d+/) -> String.to_integer(str)
      <<?:, rest::binary>> = str -> String.to_atom(rest)
      true -> str
    end
  end

end

# tax_rates = [NC: 0.075, TX: 0.08]

# orders = [
#   [id: 123, ship_to: :NC, net_amount: 100.00],
#   [id: 124, ship_to: :OK, net_amount: 35.50],
#   [id: 125, ship_to: :TX, net_amount: 24.00],
#   [id: 126, ship_to: :TX, net_amount: 44.80],
#   [id: 127, ship_to: :NC, net_amount: 25.00],
#   [id: 128, ship_to: :MA, net_amount: 10.00],
#   [id: 129, ship_to: :CA, net_amount: 102.00],
#   [id: 130, ship_to: :NC, net_amount: 50.00]
# ]