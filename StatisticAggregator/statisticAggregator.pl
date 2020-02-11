use open ':std', ':encoding(UTF-8)';
use File::Basename;
use lib dirname (__FILE__) . "/";
use vehicle;

foreach (@ARGV) {
    $current_file = $_;
    %vehicles = [];

    if (open(my $fh, '<:encoding(UTF-8)', $current_file)) {
        while (my $row = <$fh>) {

            @splitted = split(' ', $row); 
            $temp_vehicle = new vehicle($splitted[0], $splitted[1],$splitted[2],$splitted[3],$splitted[4],$splitted[5]);
            $temp_vehicle->get_delay_in_minutes();
            $trip_id = $temp_vehicle->get_trip_id();
            print "tripid:", $temp_vehicle->get_trip_id() , "\n" ;
            $vehicles->{$temp_vehicle->get_trip_id()} = $temp_vehicle;
           
        }
    }
    else
    {
        warn "Could not open file '$filename' $!";
    }

    while ( ($k,$v) = each %vehicles ) {
        print "$k\n";
    }
}