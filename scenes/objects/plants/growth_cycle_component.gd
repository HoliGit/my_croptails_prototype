class_name GrowthCycleComponent extends Node

@export var current_growth_state : DataTypes.GrowthStates = DataTypes.GrowthStates.Germination

# Non abbiamo più bisogno di days_until_harvest qui, la logica è più semplice
# @export_range(5, 365) var days_until_harvest : int = 7 

signal crop_maturity
signal crop_harvesting

var is_watered : bool = false
# Non servono più:
# var starting_day : int
# var current_day : int

func _ready() -> void:
	DayAndNightCycleManager.time_tick_day.connect(on_time_tick_day)
	
	
func on_time_tick_day(day: int)-> void:
	# Se la pianta è stata innaffiata e non è ancora matura, progredisce.
	if is_watered and current_growth_state < DataTypes.GrowthStates.Harvesting:
		# Incrementa lo stato di crescita di 1
		current_growth_state += 1
		
		# Ora la pianta non è più considerata "innaffiata" per il giorno successivo,
		# dovrà essere innaffiata di nuovo per crescere ancora.
		is_watered = false
		
		# Stampa di debug per controllare
		var name = DataTypes.GrowthStates.keys()[current_growth_state]
		print("Nuovo stato di crescita: ", name)
		
		# Emettiamo i segnali quando raggiungiamo gli stati giusti
		if current_growth_state == DataTypes.GrowthStates.Maturity:
			crop_maturity.emit()
		elif current_growth_state == DataTypes.GrowthStates.Harvesting:
			crop_harvesting.emit()

# Questa funzione non è più necessaria perché la logica è in on_time_tick_day
# func growth_states(starting_day: int, current_day: int) -> void:

# Anche questa non è più necessaria
# func harvest_state(starting_day: int, current_day: int) -> void:
		
func get_current_growth_state() -> DataTypes.GrowthStates:
	return current_growth_state
