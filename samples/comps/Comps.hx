
class Comps {
	
	var engine : h3d.Engine;
	var scene : h2d.Scene;
	
	function new() {
		engine = new h3d.Engine();
		engine.onReady = init;
		engine.init();
		// make sure that arial.ttf is inside the current class path (remove "true" to get errors)
		// emebedding the font will greatly improve visibility on flash (might be required on some targets)
		h2d.Font.embed("Arial", "arial.ttf", true);
	}
	
	function init() {
		flash.Lib.current.stage.addEventListener(flash.events.Event.ENTER_FRAME, function(_) update());
		scene = new h2d.Scene();
		var window = new h2d.comp.Component("window", scene);
		window.addCss("
			button.big {
				width : 500px;
			}
		");
		new h2d.comp.Button("Click ME!", window).onClick = function() trace("CLICKED");
		var b2 = new h2d.comp.Button("A slightly long one (styled with CSS)");
		b2.x = 50;
		b2.y = 100;
		b2.addClass("big");
		window.addChild(b2);
		b2.onClick = function() trace("CLICKED");
	}
	
	function update() {
		engine.render(scene);
		scene.checkEvents();
	}
	
	static function main() {
		new Comps();
	}
	
}