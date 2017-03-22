defmodule Entity do 
  ### Public API
  def init do 
    :gen_event.start_link()
  end

  def add_component(pid, component, args) do 
    :gen_event.add_handler(pid, component, args)
  end

  def notify(pid, event) do 
    :gen_event.notify(pid, event)
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

  def handle_event({:hit, amount}, hp) do 
    {:ok, hp-amount}
  end

  def handle_event({:heal, amount}, hp) do 
    {:ok, hp + amount}
  end

  def handle_call(:get_hp, hp) do 
    {:ok, hp, hp }
  end

  def handle_call(:alive?, hp ) do 
    {:ok, hp > 0, hp}
  end

end

defmodule XYComponent do 
  use GenEvent

  def get_position(entity) do 
    :gen_event.call(entity, XYComponent, :get_position)
  end

  ### GemEvent API
  def init(position) do 
    {:ok, position}
  end

  def handle_call(:get_position, position) do 
    {:ok, position, position}
  end

  def handle_event({:move, {:y, new_y}}, {x, _}) do 
    {:ok, {x, new_y}}
  end

  def handle_event({:move, {:x, new_x}}, {y, _}) do 
    {:ok, {new_x, y}}
  end
end

defmodule WeaponComponent do 
  use GenEvent

  ### Public API
  def list_weapons(entity) do 
    :gen_event.call(entity, WeaponComponent, :list_weapons)
  end
  ### GenEvent API
  def init(weapons) do 
    {:ok, weapons}
  end

  def handle_event({:add_weapon, weapon}, weapons) do 
    {:ok, weapons ++ [weapon]}
  end

  def handle_call(:list_weapons, weapons) do 
    {:ok, weapons, weapons}
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

  test "something with an XYComponent can move around" do 
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, XYComponent, {50,50})
    Entity.notify(entity, {:move, {:y, 35}})
    assert XYComponent.get_position(entity) == {50,35}
  end

  test "something with a WeaponComponent can manage a list of weapon" do 
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, WeaponComponent, [])
    Entity.notify(entity, {:add_weapon, "bat"})
    assert WeaponComponent.list_weapons(entity) == ["bat"]
    Entity.notify(entity, {:add_weapon, "screwdriver"})
    assert WeaponComponent.list_weapons(entity) == ["bat", "screwdriver"]
  end
end
