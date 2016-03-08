package view_aa.res {
	import d2armor.Armor;
	import d2armor.display.ImageAA;
	import d2armor.display.StateAA;
	import d2armor.events.AEvent;
	import d2armor.resource.FilesBundle;
	import d2armor.resource.ResMachine;
	import d2armor.resource.ZipBundle;
	import d2armor.resource.handlers.TextureAA_BundleHandler;
	
public class Res_StateAA extends StateAA {
	
	public function Res_StateAA( nextState:StateAA ) {
		m_nextState = nextState;
	}
	
	override public function onEnter() : void {
		this.resA = new ResMachine("");
		
		//this.resA.addBundle(new ZipBundle("img.zip"), new TextureAA_BundleHandler(1.0, false, false, "image"));
		
		var AY:Vector.<String>;
		
		AY = new <String>
			[
				"common/img/statusBar.png",
				
				"common/img/time.png",
				"common/img/swipeToUnlock.png",
				"common/img/longPressToWp.png",
				"common/img/camera.png",
				
				"common/img/txt_free.png",
				"common/img/txt_road.png",
				"common/img/txt_sheep.png",
				"common/img/txt_tower.png",
				"common/img/wp_free.png",
				"common/img/wp_road.png",
				"common/img/wp_sheep.png",
				"common/img/wp_tower.png",
				
				"common/img/toolBar.png",
				
				"common/img/maskTop1.png",
				"common/img/maskTop2.png",
				"common/img/maskBottom.png",
				
				"common/img/desktop.png"
			];
		
		this.resA.addBundle(new FilesBundle(AY), new TextureAA_BundleHandler);
		
		this.resA.addEventListener(AEvent.COMPLETE, onComplete);
	}
	
	public var resA:ResMachine;
	private var m_nextState:StateAA;
	
	private function onComplete(e:AEvent):void {
		this.resA.removeEventListener(AEvent.COMPLETE, onComplete);
		
		this.getFusion().setState(m_nextState);
		
	}
}
}