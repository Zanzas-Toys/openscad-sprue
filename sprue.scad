// parameters for the sprue
// keep sprueWidth a multiple of your nozzle width,
// and sprueHeight a multiple of your layer height
sprueWidth = 1.2;
sprueHeight = 0.6;

// model: relative path to the model to duplicate
// spacing: separation between instances, in mm
// numX: number to duplicate horizontally
// numY: number to duplicate depth-wise
//
// Example usage: 
// makeSprue("myModel.stl", 10, 5, 2);

module makeSprue(model, spacing, numX, numY) {
    totalX = (numX - 1) * spacing;
    totalY = (numY - 1) * spacing;

    union() {
        translate([-totalX/2, -totalY/2, 0]) {

        for (i=[0:numY-1]) {
            translate([0,  i*spacing- (sprueWidth/2), 0])
            cube([totalX, sprueWidth, sprueHeight] );
        }

        for (i=[0:numX-1]) {
            translate([i*spacing- (sprueWidth/2), 0, 0])
            cube([sprueWidth, totalY, sprueHeight] );
        }


        for (i=[0:numX-1]) {
            for (j=[0:numY-1]) {
                translate([i*spacing, j*spacing, 0])
                import(model);
            }
        }

        }
    }
}

module makeSprueWithGap(model, spacing, gap, numX, numY) {
    totalX = (numX - 1) * spacing;
    totalY = (numY - 1) * spacing;

    lenX = spacing - gap;
    lenY = spacing - gap;


    union() {
        translate([-totalX/2, -totalY/2, 0]) {

        for (i=[0:numY-1]) {
            for (j=[0:numX-2]) {
                pos = (j * spacing) + (gap/2);
                translate([pos,  i*spacing- (sprueWidth/2), 0])
                cube([lenX, sprueWidth, sprueHeight] );
            }
        }

        for (i=[0:numX-1]) {
            for (j=[0:numY-2]) {
                pos = (j * spacing) + (gap/2);
                translate([i*spacing- (sprueWidth/2), pos, 0])
                cube([sprueWidth, lenY, sprueHeight] );
            }
        }

        
        for (i=[0:numX-1]) {
            for (j=[0:numY-1]) {
                translate([i*spacing, j*spacing, 0])
                import(model);
            }
        }
        

        }
    }
}

