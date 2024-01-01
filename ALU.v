CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute (out = x + y) or (out = x & y)?
        no; // negate the out output?
    OUT 
        out[16], // 16-bit output
        zr,      // if (out == 0) equals 1, else 0
        ng;      // if (out < 0)  equals 1, else 0

    PARTS:
    Mux16(a=x, b[0..15]=false, sel=zx, out=xMux);
    Not16(in=xMux, out=xNot);
    Mux16(a=xMux, b=xNot, sel=nx, out=tempX);

    Mux16(a=y, b[0..15]=false, sel=zy, out=yMux);
    Not16(in=yMux, out=yNot);
    Mux16(a=yMux, b=yNot, sel=ny, out=tempY);

    And16(a=tempX, b=tempY, out=XandY);
    Add16(a=tempX, b=tempY, out=XaddY);
    Mux16(a=XandY, b=XaddY, sel=f, out=fOut);

    Not16(in=fOut, out=fNot);
    Mux16(a=fOut, b=fNot, sel=no, out=out, out[15]=ng, out[0..7]=zrLow, out[8..15]=zrHigh);

    Or8Way(in=zrLow, out=or1Out);
    Or8Way(in=zrHigh, out=or2Out);
    Or(a=or1Out, b=or2Out, out=orOut);
    Not(in=orOut, out=zr);

}