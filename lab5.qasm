OPENQASM 2.0;
include "qelib1.inc";
gate inc a, b, c {
  ccx c, b, a;
  cx c, b;
}

gate dec a, b, c {
  x b;
    x c;
    ccx c, b, a;
    x b;
    cx c, b;
    x c;
}

gate step a, b, c{
  h c;
  inc a, b, c;
  dec a, b, c;
}

qreg q[3];
creg c[2];
reset q[0];
reset q[1];
reset q[2];
step q[0], q[1], q[2];
step q[0], q[1], q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];