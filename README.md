# OMJava
OpenModelica Java Interface

Clone the OMJava into the OpenMoelica root directory at the same level with OMCompiler
`git clone https://github.com/OpenModelica/OMJava.git`

To get the dependencies run `make dep`
This will download the needed jars from: https://build.openmodelica.org/omc/java/OMJava-3rdParty.zip
and unpack into 3rdParty

```
unzip -un OMJava-3rdParty.zip
Archive:  OMJava-3rdParty.zip
  inflating: 3rdParty/antlr/antlr-3.2.jar
  inflating: 3rdParty/hamcrest-core-1.3.jar
  inflating: 3rdParty/idl.jar
  inflating: 3rdParty/jacorb-3.9.jar
  inflating: 3rdParty/jacorb-omgapi-3.9.jar
  inflating: 3rdParty/jacorb-services-3.9.jar
  inflating: 3rdParty/jboss-rmi-api_1.0_spec-1.0.6.Final.jar
  inflating: 3rdParty/junit-4.13.jar
  inflating: 3rdParty/picocontainer-1.2.jar
  inflating: 3rdParty/slf4j-api-1.7.14.jar
  inflating: 3rdParty/slf4j-jdk14-1.7.14.jar
  inflating: 3rdParty/wrapper-3.1.0.jar
```

To build, simply use the command `make` and then use the generated jar-file somewhere.
To install the modelica_java.jar and dependencies into the OpenModelica/build/share/omc/java directory run `make install`

The existing jUnit should work with `make test`.

