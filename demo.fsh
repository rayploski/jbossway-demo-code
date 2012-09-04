@currentStep = 1;
@v = SHELL.prompt("Start at which step?");
@startAt = Integer.parseInt( "".equals(v.trim()) ? 1 : v );

def step( cmd ) { 

	if ( startAt <= currentStep )
	{
		@SHELL.println();
		if ( SHELL.promptBoolean("Execute " + currentStep + ": " + cmd + " ?") )
		{
			@SHELL.println();
			$cmd;
			@SHELL.println();
			wait;
			clear;
		}
	}
	currentStep ++;

};

clear;
@step("new-project --named javaOne --topLevelPackage com.jboss.demo");
@step("scaffold setup  --scaffoldType faces"); 
@step("persistence setup --provider HIBERNATE --container JBOSS_AS7");
@step("entity --named Customer --package ~.domain");
@step("field string --named firstName");
@step("field string --named lastName");
@step("field temporal --type DATE --named birthDate");

