from Aggregator.DTO.Vehicle import Vehicle


class StopInfoData(object):
    stop_id: str
    stop_name: str
    actual_vehicles: list

    def __init__(self, stop_id: str, stop_name: str):
        self.actual_vehicles = []
        self.stop_id = stop_id
        self.stop_name = stop_name

    def add_vehicle(self, vehicle: Vehicle):
        self.actual_vehicles.append(vehicle)

    def to_string(self):
        value = ""
        for vehicle in self.actual_vehicles:
            value = value + vehicle.to_string() + "\n"
        return value
