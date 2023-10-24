extends CharacterBody2D

const speed = 40

var direction : Vector2

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	direction = position

func _physics_process(delta: float):
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	make_path()

func make_path():
	nav_agent.target_position = direction
