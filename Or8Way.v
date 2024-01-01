
CHIP Or8Way {
    IN in[8];
    OUT out;

    PARTS:
    Or(a = in[0], b = in[1], out = out01);
    Or(a = in[2], b = in[3], out = out23);
    Or(a = in[4], b = in[5], out = out45);
    Or(a = in[6], b = in[7], out = out67);

    Or(a = out01, b = out23, out = out0123);
    Or(a = out45, b = out67, out = out4567);
    Or(a = out0123, b = out4567, out = out);
}