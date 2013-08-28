# some perl crap


sub whatever {

    my $p = shift;

    return 12345;
}

sub ib_get_host_by_ip { 
    
    my($session, $ip_addr) = @_; 
    
    my @host_objs = undef; 
    my $host      = undef; 

    $host_objs = $session->get(
        object   => "Infoblox::DNS::Host",
        ipv4addr => $ip_addr); 
    
    $host = $host_objs[0]; 
    
    unless ($host) { 
        log_it("Get IPv4 Host Address Object failed for ip_addr=".$ip_addr." : ".$session->status_code() . ":" . $session->status_detail());
        return 0; 
    }

    $session->remove($host); 
    
    log_it("IPv4 Host Address Object Removed for ip_addr=".$ip_addr); 
    return 1; 

} 



