use open ':std', ':encoding(UTF-8)';
use File::Basename;
use lib dirname (__FILE__) . "/";
use vehicle;
use staticticsCalculator;

foreach (@ARGV) {
    $current_file = $_;
    %vehicles;

    if (open(my $fh, '<:encoding(UTF-8)', $current_file)) {
        while (my $row = <$fh>) {

            @splitted = split(' ', $row); 
            $temp_vehicle = new vehicle($splitted[0], $splitted[1],$splitted[2],$splitted[3],$splitted[4],$splitted[5]);
            $temp_vehicle->get_delay_in_minutes();
            $trip_id = $temp_vehicle->get_trip_id();
            $vehicles{$trip_id} = $temp_vehicle;
            # print "Added vehicle key: ", $trip_id," value:", $vehicles{$trip_id}->toString(), "\n";
        }
    }
    else
    {
        warn "Could not open file '$filename' $!";
    }
     foreach my $key (keys %vehicles) {
        # print $key, '=>>>>>>';
        # print $vehicles{$key}->toString(),  "\n";
    }
    $calculator = new staticticsCalculator();
    $calculator->print_line_ranking(%vehicles);

}