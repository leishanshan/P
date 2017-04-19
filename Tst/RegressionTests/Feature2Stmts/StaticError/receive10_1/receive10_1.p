// This sample captures the behavior of null inside receive. This regression should be involved with the -m option in zing.
// The traces reported should contain only 2 traces assert at line 30 and assert at 36. The unhandled because of send this, E, 10; should not happen.
//This test is identical to receive10, but exercises a different assert.

event E : int;
event F;
event Unit;

machine Main {
	var x: int;
	start state Init {
		entry {
			var b: machine;
		    b = new B();
			send b, F;
		}
	}
}

machine B {
	var x : int;
	start state Init {
		entry {
			raise Unit;
		}
		on Unit goto X;
	}
	
	state X {
		entry {
			receive {
				case F: { 
					send this, E, 10; 
					/*assert(false);*/
				}
				case null : {raise F;}
			}
		
			
		}
		on F goto X with { assert false;}   //fails
	}
}