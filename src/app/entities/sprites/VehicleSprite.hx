package app.entities.sprites;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.Event;

import app.components.Vehicle;

/*
    Dieses Sprite repräsentiert die Grafik des Autos.
    Es ist das einzige Sprite, dass während der Laufzeit dynamisch veränder wird - 
    nämlich, je nach Einschlag des Lenkrads.
*/
class VehicleSprite extends Sprite {

    private var vehicle: Vehicle; //Referenz auf die Vehikelkomponente, die die Informationen speichert, um das Auto zeichnen zu könnnen.

    //Repräsentiert je einen Reifen
    private var wheeltopLeft: Sprite;  
    private var wheelTopRight: Sprite;
    private var wheelBottomLeft: Sprite;
    private var wheelBottomRight: Sprite;

    public function new(vehicle: Vehicle) {
        super();
        this.vehicle = vehicle;

        //Reifen-Sprites erstellen und positionieren
        wheeltopLeft = this.getWheelSprite();
        wheeltopLeft.x = 40;
        wheeltopLeft.y = -70;
        addChild(this.wheeltopLeft);

        wheelTopRight = this.getWheelSprite();
        wheelTopRight.x = -40;
        wheelTopRight.y = -70;
        addChild(this.wheelTopRight);

        wheelBottomLeft = this.getWheelSprite();
        wheelBottomLeft.x = 40;
        wheelBottomLeft.y = 70;
        addChild(this.wheelBottomLeft);

        wheelBottomRight = this.getWheelSprite();
        wheelBottomRight.x = -40;
        wheelBottomRight.y = 70;
        addChild(this.wheelBottomRight);


        //Chassis laden und postionieren
        var chassis: Bitmap = new Bitmap(Assets.getBitmapData("assets/textures/car1.png"));
        chassis.x = -chassis.width/2;
        chassis.y = -chassis.height/2;
        addChild(chassis);

        //Events registrieren
        addEventListener(Event.ENTER_FRAME, onEnterFrame); 

    }


    //Wird aufgerufen, bevor gezeichnet wird.
    private function onEnterFrame(event: Event) : Void {

        //Den aktuellen Winkel der Vorderreifen aus der Vehikel-Komponente auslesen und anwenden.
        wheelTopRight.rotation = vehicle.steerAngle;
        wheeltopLeft.rotation = vehicle.steerAngle;

    }

    //Gibt einen neuen Reifensprite zurück
    private function getWheelSprite() : Sprite {

        var wheel: Sprite = new Sprite();
        wheel.graphics.beginFill(0x222222);
        wheel.graphics.drawRect(-7, -14, 14, 28); //Reifen zeichnen

        return wheel;
    }

}