package jancassio.utils
{
	import flash.utils.Dictionary;

	/**
	 * Delegate class store, retrive and create a simple delegate function with undefined number of parameters.
	 * @author janio | janio@jancassio.com
	 * @version 1.0
	 * @usage
	 * <code>
	 * 		var delegate : Delegate;
	 * 		
	 * 		delegate = new Delegate;
	 * 		delegate.create(doIt, 'Do it called', {a:1, b:'b'})();
	 * 
	 * 		function doIt (p1:String, p2:Object) : void
	 * 		{
	 * 			trace('Param 1: ', p1);
	 * 			trace('Param 2: ', p2);
	 * 		}
	 * </code>
	 */
	final public class Delegate implements IDisposable
	{
		private static var stored : Dictionary;
		
		public function Delegate ()
		{
			stored = new Dictionary;
		}
		
		
		/**
		 * Creates a simple function delegate.
		 * @param	method
		 * @param	...params
		 */
		public static function create ( method : Function, ...params ) : Function
		{
			return ( function (...inner_params) : void
				{
					method.apply( method.prototype, inner_params.concat( params ) );
				}
			);
		}
		
		
		/**
		 * Creates and store a function reference.
		 * @param	method
		 * @param	...params
		 * @usage
		 * <code>
		 * addEventListener(Event.CHANGE, Delegate.store(onChange, 1, {a:'a', b:"B"}) );
		 * 
		 * function onChange (event : Event, num : int, obj : Object) : void
		 * {
		 * 		trace(event.type);	// outputs "change"
		 * 		trace(num);		// outputs 1
		 * 		trace(obj.b)	// outputs "B"
		 * }
		 * </code>
		 */
		public function store ( method : Function, ...params ) : Function
		{
			return stored[ method ] = ( function (...inner_params) : void
				{
					method.apply( method.prototype, inner_params.concat( params ) );
				}
			);
		}
		
		
		
		/**
		 * Retrieves a stored function reference.
		 * @param	method
		 * @usage
		 * <code>
		 * addEventListener(Event.CHANGE, Delegate.store(onChange, 1, {a:'a', b:"B"}) );
		 * 
		 * function onChange (event : Event, num : int, obj : Object) : void
		 * {
		 * 		trace(event.type);	// outputs "change"
		 * 		trace(num);		// outputs 1
		 * 		trace(obj.b)	// outputs "B"
		 * 		removeEventListener( Event.CHANGE, Delegate.retrieve( onChange ) );
		 * }
		 * </code>
		 */
		public function retrieve ( method : Function ) : Function
		{
			return stored[ method ];
		}
		
		
		/**
		 * Remove a stored function reference.
		 * @param	method
		 */
		public function remove ( method : Function ) : Function
		{
			var callback : Function;
			
			callback = stored[ method ];
			
			stored[ method ] = undefined;
			delete stored[ method ];
			
			return callback;
		}
		
		
		/**
		 * Cleanup stored instances, after this action, all references is lost.
		 */
		public function dispose () : void
		{
			var p : String;
			
			for (p in stored)
			{
				stored[p] = undefined;
				delete stored[p];
			}
		}
	}
	
}