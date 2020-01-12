from Aggregator.Vehicle import Vehicle


class StopInfoData(object):
    stop_id: str
    stop_name: str
    actual_vehicles: list

    def __init__(self, stop_id: str):
        actual_vehicles = []
        self.stop_id = stop_id

    def add_vehicle(self, vehicle: Vehicle):
        self.actual_vehicles.append(vehicle)
