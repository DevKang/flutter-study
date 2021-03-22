makeOrder()
{
  return ("I want a pizza");
}

makeMyFood(food)
{
  return ("This is your ${food}");
}

cancleMyFood(error)
{
  error = "Your order is cancled";
  return (error);
}

void main() async
{
  Future<String> receivedOrder = await makeOrder();
  receivedOrder.then((value) => makeMyFood(value))
        .catchError((error) => cancleMyFood(error));
}