# OpenSCAD Sprue generator

This is a simple script meant to help when printing multiples of small objects.

I make a lot of acessories for 1:18 (four inch) action figures, which means I'm often printing very small objects, on the order of 10mm tall and 5mm diameter.
I generally want to print a bunch of a given object, and I've had many, many failed prints when a single copy detaches and ruins the rest of the job.

This script makes it easy to make an array of objects connected by easily removed sprues. The combined object ends up being much more stable, and its easy to snip off the sprues after the fact.

True, this does waste a small amount of plastic, but far less than if the print fails.

So, instead of having something like this:

...you can instead print something like this:



...getting more copies and with more reliability.

# Usage

To use the script, download it and either add it to your project directory or your OpenSCAD library folder.

Import the `sprue.scad` and invoke it in the following way:

makeSprue("yourModel.stl", 12, 5, 5);

The arguments are, in order:

- a path to an STL file that you'd like to duplicate
- the separation between subsequent objects, in millimeters
- the number of copies to make in the X direction
- the number of copies to make in the Y direction


