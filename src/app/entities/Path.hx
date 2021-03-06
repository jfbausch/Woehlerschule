package app.entities;

import ash.core.Entity;
import openfl.Assets;
import openfl.display.BitmapData;

import app.math.Vector2;
import app.components.PathComponent;

/*
    Repräsentiert den Pfad, auf dem sich die Ziel-Entität bewegt.
*/
class Path extends Entity {

    public function new(target: Entity, start: Vector2, end: Vector2) {
        super();

        this.add( new PathComponent(target, start, end) );


    }

}