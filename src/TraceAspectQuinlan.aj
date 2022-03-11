/*
 * This should trace the execution of each method in
 * DataApp.java, ComponentApp.java, and ServiceApp.java
 * that has the following method signature:
 * String getName() { return name; }
 * 
 * Before Execution: method signature and method line number
 * After Execution: method's file name 
 */
public aspect TraceAspectQuinlan {

	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	//pointcut classToTrace(): within(*App);
	
	//Tracing method
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	//Tracing before
	before(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSignature() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("\t [BEFORE]  " + info);
	}
	
	//Tracing after
	after(): methodToTrace() {
		System.out.println("\t [AFTER]   " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
	
}
