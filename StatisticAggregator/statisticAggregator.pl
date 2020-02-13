use open ':std', ':encoding(UTF-8)';
use File::Basename;
use lib dirname (__FILE__) . "/";
use vehicle;
use staticticsCalculator;

if( $ARGV[0] eq '-h' || $ARGV[0] eq '-help')
{
    print "************************************************************\n";
    print "This is statistcs aggregator. It takes output from python script (TTSSProxy/aggregator.py) and process it.\n";
    print "!!! This is not full program. Use /Client/client.sh instead !!!!!";
    print "Arguments: \n";
    print "-h, -help -> Displays help\n";
    print "<noarguments> pathToDataFile -> process *.data file and displays statistics. \n";
    print "************************************************************\n";
    exit;
}

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
        }
    }
    else
    {
        warn "Could not open file '$filename' $!";
    }

    $calculator = new staticticsCalculator();
    $calculator->print_line_ranking(%vehicles);

}