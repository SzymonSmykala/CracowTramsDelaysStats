package staticticsCalculator;
use File::Basename;
use lib dirname (__FILE__) . "/";
use line;

sub new{
    my $class = shift;
    my $self = {
        _dict => {}
    };
    bless $self, $class;

    return $self;
}

sub print_line_ranking {
    my ( $self, %vehicles ) = @_;
    my %lines;

    while ( ($k,$v) = each %vehicles ) {
        $v = $vehicles{$k};
        my $line_id = $v->get_line_id();
        my $current_line;
        if (exists($lines{$line_id}))
        {
            $current_line = $lines{$line_id};
        }else{
            $current_line = new line($line_id);
        }
        $current_line->add_delay($v->get_delay_in_minutes());
        $lines{$line_id} = $current_line;
    }
    print "******* STATISTICS *******\n";

    my $delay_count = 0;
    my $delay_sum = 0;
    foreach my $key (keys %lines) {
        $temp_delay = $lines{$key}->get_avg_delay();
        print "Line: ", $key, " average delay: ", $temp_delay, " minutes \n";
        $delay_count = $delay_count + 1;
        $delay_sum = $delay_sum + $temp_delay;
    }
    print "\nAverage delay of all lines: ", $delay_sum / $delay_count, " minutes \n\n";

}

1;