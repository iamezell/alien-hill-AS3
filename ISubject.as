package {
	public interface ISubject {
		function registerObserver(o:IObserver):void;
		function removeObserver(o:IObserver):void;
		function notifyObserver():void;
	}
}