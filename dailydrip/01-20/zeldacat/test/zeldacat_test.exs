defmodule Entity do 
  ### Public API
  def init do 
    :gen_event.start_link()
  end

  def add_component(pid, component, args) do 
    :gen_event.add_handle(pid, component, args)
  end
end

defmodule HealthComponent do 
  use GenEvent

  ### Public API 
  def get_hp(entity) do 
    :gen_event.call(entity, HealthComponent, :get_hp)
  end
   
  def alive?(entity) do 
    :gen_event.call(entity, HealthComponent, :alive?)
  end
  ### GenEvent API
  def init(hp) do 
    {:ok, hp}
  end

  def handle_call(:get_hp, hp) do 
    {:ok, hp, hp }
  end

  def handle_call(:alive?, hp ) do 
    {:ok, hp > 0, hp}
  end

end
defmodule ZeldacatTest do
  use ExUnit.Case

  test "something with a health component can die" do
    # Create Entity, add health componenet, then kill it!
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    assert HealthComponent.alive?(entity) == true

    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 50

    Entity.notify(entity, {:heal, 25})
    assert HealthComponent.get_hp(entity) == 75

    Entity.notify(entity, {:hit, 75})
    assert HealthComponent.get_hp(entity) == 0
    assert HealthComponent.alive?(entity) == false

  end
end
