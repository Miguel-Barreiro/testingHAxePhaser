package ;

import phaser.gameobjects.Sprite;
import phaser.core.Game;

class Player {

    public var playerBody : Sprite;

    public function new( start : Position, game : Game ) {

// The player and its settings
//        playerBody = game.add.sprite(start.x, start.y, 'dude');
        playerBody = game.add.sprite(32, game.world.height - 150, 'dude');

//  We need to enable physics on the player
        game.physics.arcade.enable(playerBody);

//  Player physics properties. Give the little guy a slight bounce.
        playerBody.body.bounce.y = 0.2;
        playerBody.body.gravity.y = 300;
        playerBody.body.collideWorldBounds = true;

//  Our two animations, walking left and right.
        playerBody.animations.add('left', [0, 1, 2, 3], 10, true);
        playerBody.animations.add('right', [5, 6, 7, 8], 10, true);

        trace("player created");

    }

}
