class Vehicle(object):
    direction: str
    line_id: str
    status: str
    planned_time: str
    trip_id: str
    actual_time: str

    def __init__(self, direction: str, line_id: str, status: str, planned_time: str, trip_id: str, actual_time: str):
        self.direction = direction
        self.line_id = line_id
        self.status = status
        self.planned_time = planned_time
        self.trip_id = trip_id
        self.actual_time = actual_time
