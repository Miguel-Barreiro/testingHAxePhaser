package ;

import phaser.gameobjects.Sprite;
import phaser.physics.arcade.Body;
import phaser.core.Group;
import haxe.macro.Expr.Position;
import phaser.core.Game;
import phaser.core.Group;
import phaser.Phaser;
import phaser.input.Keyboard;
import phaser.physics.Physics;

class SuperSlick {

    var game:Game;
//    var player: Player;
    var player: Sprite;
    var platforms: Group;

    public function new () {
        game = new Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create });
    }

    public function create ():Void {

        game.input.keyboard.addCallbacks(null, null, onKeyUp);


        game.physics.startSystem(Physics.ARCADE);

//        player = new Player( {x:100,y:100}, game);

        game.add.sprite(0, 0, 'sky');

        platforms = game.add.group();
        platforms.enableBody = true;
        var ground = platforms.create(0, game.world.height - 64, 'ground');
        ground.scale.setTo(2, 2);
        ground.body.immovable = true;

        var ledge = platforms.create(400, 400, 'ground');
        ledge.body.immovable = true;
        ledge = platforms.create(-150, 250, 'ground');
        ledge.body.immovable = true;


    }

    function createPlayer(){
//  The player and its settings
        player = game.add.sprite(32, game.world.height - 150, 'dude');

//  We need to enable physics on the player
        game.physics.arcade.enable(player);

//  Player physics properties. Give the little guy a slight bounce.
        player.body.bounce.y = 0.2;
        player.body.gravity.y = 300;
        player.body.collideWorldBounds = true;

//  Our two animations, walking left and right.
        player.animations.add('left', [0, 1, 2, 3], 10, true);
        player.animations.add('right', [5, 6, 7, 8], 10, true);

    }



    function preload() {

        game.load.image('sky', 'assets/sprites/sky.png');
        game.load.image('ground', 'assets/sprites/platform.png');
        game.load.image('star', 'assets/sprites/star.png');
        game.load.spritesheet('dude', 'assets/sprites/dude.png', 32, 48);
    }


    function update() {
        game.physics.arcade.collide(player, platforms);
    }

    function onKeyUp(event) {
        switch (event.keyCode) {
            case Keyboard.LEFT:
                return;
            case Keyboard.RIGHT:
                return;
            case Keyboard.UP:
                return;
            case Keyboard.DOWN:
                return;
        }
    }

    static function main ():Void {
        var game : SuperSlick = new SuperSlick();
    }

}