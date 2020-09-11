include Makefile.common

dep:
	wget https://build.openmodelica.org/omc/java/OMJava-3rdParty.zip
	unzip -un OMJava-3rdParty.zip

modelica_java.jar: $(java_sources)
	@echo "* Compiling modelica_java.jar"
	rm -rf bin-jar; mkdir bin-jar
	"$(JAVAC)" -encoding utf8 -cp "$(antlr)$(sep)$(corba)" -d bin-jar $(java_sources)
	"$(JAR)" cf modelica_java.jar $(java_sources:src/%=-C src %) $(resources:src/%=-C src %) -C bin-jar . || (rm $@ && false)
	
install: ../build/share/omc/java/modelica_java.jar

../build/share/omc/java/modelica_java.jar: modelica_java.jar
	cp 3rdParty/*.jar ../build/share/omc/java/
	
test: $(java_sources) 
	rm -rf bin-test; mkdir bin-test
	"$(JAVAC)" -encoding utf8 -cp "$(antlr)$(sep)$(junit)$(sep)$(corba)" -d bin-test $(java_sources) $(java_tests)
	"$(JAVA)" -cp "bin-test$(sep)src$(sep)$(antlr)$(sep)$(junit)$(sep)$(corba)" org.junit.runner.JUnitCore $(junit_tests)
