var IDCount = 0;
//save all data of object
var SaveElementsinArr = [];
var SaveXYofElements = [];

//************************Parsing***************************************

function R(CMLtag) {
    var Rattributes = {};
    var startNode = {};
    var endNode = {};
    var I = {};
    var V = {};
    //alert(CMLtag);

    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    // alert(CMLtag2);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //alert(element);
        // element = jQuery.parseJSON(element);
        // element = element.evalJSON();
        //  alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "r":
                GeneralR(Rattributes, element.attributes.name, element.attributes.type, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "node":
                if (i % 2 == 0) {
                    GeneralNode(startNode, element.attributes.row, element.attributes.col, IDCount++)

                }
                else {
                    GeneralNode(endNode, element.attributes.row, element.attributes.col, IDCount++)

                }
                break;
            case "Ir":
                GeneralElement(I, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix)

                break;
            case "Vr":
                GeneralElement(V, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix)

                break;
            default:

        }
    }
    var RElements = { "Attributes": Rattributes, "StartNode": startNode, "EndNode": endNode, "I": I, "V": V };

    //alert(RElements);
    return RElements;
}

function Gate(CMLtag, GateName) {
    var Name;
    var InputNode1 = {};
    var InputNode2 = {};
    var InputNode3 = {};
    var InputNode4 = {};
    var input = [InputNode1, InputNode2, InputNode3, InputNode4];
    var GOutput = {};
    var pinNumFlag = 0;
    var prevNodeName;
    //  alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case GateName:

                Name = element.attributes.name;
                //alert(Name);

                break;
            case "pin":
                //alert("PrevNodeName");
                // alert(prevNodeName);
                if (prevNodeName == "inputs" || prevNodeName == "pin") {
                    //  alert("input");

                    GeneralNode(input[pinNumFlag], element.attributes.row, element.attributes.col, IDCount++);
                    pinNumFlag++;
                }
                if (prevNodeName == "output") {
                    //  alert("output");
                    GeneralNode(GOutput, element.attributes.row, element.attributes.col, IDCount++);

                }

                break;
            default:
                prevNodeName = element.nodeName;

        }
    }
    var ORElement = { "Attributes": Name, "Input": input, "Output": GOutput };
    // alert(ORElement);
    return ORElement;

}

function Not(CMLtag) {
    var Name;
    var InputNode = {};
    var GOutput = {};

    // alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "not":
                Name = element.attributes.name;
                //  alert(Name);
                break;
            case "pin":
                //  alert("PrevNodeName");
                //  alert(prevNodeName);
                if (prevNodeName == "inputs") {
                    //  alert("input");
                    GeneralNode(InputNode, element.attributes.row, element.attributes.col, IDCount++);

                }
                if (prevNodeName == "output") {
                    //  alert("output");
                    GeneralNode(GOutput, element.attributes.row, element.attributes.col, IDCount++);

                }
                break;
            default:
        }
        prevNodeName = element.nodeName;

    }
    var NotElement = { "Attributes": NotAtt, "Input": InputNode, "Output": GOutput };
    //  alert(NotElement);
    return NotElement;

}

function Transistor(CMLtag) {
    var TransistorAtt = {};
    var EmitterPoint = {};
    var BasePoint = {};
    var CommitterPoint = {};
    var VBE = {};
    var VCE = {};
    var VBC = {};
    var VCC = {};
    var Vin = {};
    var IB = {};
    var IC = {};
    var IE = {};
    var Alpha = {};
    var Beta = {};
    //alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName) {
            case 'transistor':
                TransistorAtt.Name = element.attributes.name;
                TransistorAtt.Type = element.attributes.type;
                break;
            case 'emitter':
                GeneralNode(EmitterPoint, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case 'tbase':
                GeneralNode(BasePoint, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case 'committer':
                GeneralNode(CommitterPoint, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case 'vbe':
                GeneralElement(VBE, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix); GeneralElement
                break;
            case 'vce':
                GeneralElement(VCE, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix); GeneralElement
                break;
            case 'vbc':
                GeneralElement(VBC, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix); GeneralElement
                break;
            case 'vcc':
                GeneralElement(VCC, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix); GeneralElement
                break;
            case 'vin':
                GeneralElement(Vin, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case 'ib':
                GeneralElement(IB, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case 'ic':
                GeneralElement(IC, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case 'ie':
                GeneralElement(IE, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case 'alpha':
                GeneralPoint(Alpha, element.attributes.name, element.attributes.value, element.attributes.prefix)
                break;
            case 'beta':
                GeneralPoint(Beta, element.attributes.name, element.attributes.value, element.attributes.prefix)
                break;
            default:
        }
    }
    var Elements = {
        "Attributes": TransistorAtt, "BasePoint": BasePoint, "CommitterPoint": CommitterPoint, "EmitterPoint": EmitterPoint, "Volts": [{ "VBE": VBE }, { "VCE": VCE },
            { "VCC": VCC }, { "VIn": Vin }], "Current": [{ "IB": IB }, { "IC": IC }, { "IE": IE }], "Alpha": Alpha, "Beta": Beta
    };

    //  alert(Elements);
    return Elements;
}

function Switch(CMLtag) {
    var SwitchAtt = {} // name , type => first element name
    var FPole = {};
    var SPole = {};
    var FThrow = {};
    var SThrow = {};
    var PoleFlag = 0;
    var ThrowFlag = 0;
    //  alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "spst":
            case "spdt":
            case "dpst":
            case "dpdt":

                SwitchAtt.Type = element.nodeName;
                SwitchAtt.Name = element.attributes.name;
                break;
            case "bushbutton":
                SwitchAtt.Type = element.nodeName;
                break;
            case "point":
            case "pole":
                switch (PoleFlag) {
                    case 0:
                        
                        GeneralNode(FPole, element.attributes.row, element.attributes.col, IDCount++);
                        PoleFlag++;
                        break;
                    case 1:
                        GeneralNode(SPole, element.attributes.row, element.attributes.col, IDCount++);
                        PoleFlag++;
                        break;
                    default:

                }
                break;
            case "throw":
                switch (ThrowFlag) {
                    case 0:
                        GeneralThrow(FThrow, element.attributes.state, element.attributes.row, element.attributes.col, IDCount++);
                        ThrowFlag++;
                        break;
                    case 1:
                        GeneralThrow(SThrow, element.attributes.state, element.attributes.row, element.attributes.col, IDCount++);
                        ThrowFlag++;
                        break;
                    default:

                }
                break;


        }
    }
    var elements = { "Attributes": SwitchAtt, "Poles": [{ "FirstPole": FPole }, { "SecondPole": SPole }], "Throw": [{ "FirstThrow": FThrow }, { "SecondThrow": SThrow }] };
    return elements;
}

function C(CMLtag) {
    var CAtt = {};
    var Z = {};
    var Cathode = {};
    var Anode = {};
    var Vc = {};
    var Ic = {};
    var G = {};
    var Capacitance = {};
    //alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "c":
                GeneralTypeForC(CAtt, element.attributes.name, element.attributes.type);
                break;
            case "cathode":
                GeneralNode(Cathode, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case "anode":
                GeneralNode(Anode, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case "z":
                GeneralElement(Z, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "vc":
                GeneralElement(Vc, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "ic":
                GeneralElement(Ic, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "capacitance":
                GeneralElement(Capacitance, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "g":
                GeneralElement(G, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;

        }
    }
    var elements = { "Attributes": CAtt, "Cathode": Cathode, "Anode": Anode, "Z": Z, "VC": Vc, "IC": Ic, "G": G, "Capacitance": Capacitance };

    return elements;

}

function L(CMLtag) {
    var LAtt = {};
    var Z = {};
    var StartNode = {};
    var EndNode = {};
    var VL = {};
    var IL = {};
    var Inductance = {};
    var R = {};
    var NodeFlag = 0;
    // alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "l":
                GeneralType(LAtt, element.attributes.name, element.attributes.value);
                break;
            case "node":
                switch (NodeFlag) {
                    case 0:
                        GeneralNode(StartNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    case 1:
                        GeneralNode(EndNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    default:

                }
                break;

            case "z":
                GeneralElement(Z, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "vl":
                GeneralElement(VL, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "il":
                GeneralElement(IL, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "inductance":
                GeneralElement(Inductance, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "r":
                GeneralElement(R, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;

        }
    }
    var elements = { "Attributes": LAtt, "StartNode": StartNode, "EndNode": EndNode, "Z": Z, "VL": VL, "IL": IL, "R": R, "Inductance": Inductance };
    return elements;
}

function Idc(CMLtag) {
    var IDCAtt = {};
    var Positive = {};
    var Negative = {};
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    // alert(CMLtag);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //alert(element);
        // element = jQuery.parseJSON(element);
        // element = element.evalJSON();
        // alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "idc":
                GeneralElement(IDCAtt, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);


                break;
            case "positive":

                GeneralNode(Positive, element.attributes.row, element.attributes.col, IDCount++);

                break;
            case "negative":

                GeneralNode(Negative, element.attributes.row, element.attributes.col, IDCount++);

                break;

        }
    }
    var elements = { "Attributes": IDCAtt, "PositiveNode": Positive, "NegativeNode": Negative };
    return elements;
}

function Vdc(CMLtag) {
    var VDCAtt = {};
    var Positive = {};
    var Negative = {};
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    // alert(CMLtag2);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //alert(element);
        // element = jQuery.parseJSON(element);
        // element = element.evalJSON();
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "vdc":
                GeneralElement(VDCAtt, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "positive":
                GeneralNode(Positive, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case "negative":
                GeneralNode(Negative, element.attributes.row, element.attributes.col, IDCount++);

                break;

        }
    }
    var elements = { "Attributes": VDCAtt, "PositiveNode": Positive, "NegativeNode": Negative };
    return elements;
}

function Connector(CMLtag) {
    var name;
    var StartNode = {};
    var EndNode = {};
    var NodeFlag = 0;

    //alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //  alert("Node Name ");
        //  alert(element.nodeName);

        switch (element.nodeName.toLowerCase()) {
            case "connector":
                name = element.attributes.name;
                break;
            case "node":
                switch (NodeFlag) {
                    case 0:
                        GeneralNode(StartNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    case 1:
                        GeneralNode(EndNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    default:
                }
        }

    }
    var elements = { "Attributes": name, "StartNode": StartNode, "EndNode": EndNode };
    return elements;
}

function Vac(CMLtag) {
    var name;
    var StartNode = {};
    var EndNode = {};
    var NodeFlag = 0;
    var Vpeak = {};
    var Energy = {};
    var Frequency = {};
    //alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //  alert("Node Name ");
        //  alert(element.nodeName);

        switch (element.nodeName.toLowerCase()) {
            case "vac":
                name = element.attributes.name;
                break;
            case "point":
                switch (NodeFlag) {
                    case 0:
                        GeneralNode(StartNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    case 1:
                        GeneralNode(EndNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    default:

                }
                break;
            case "vpeak":
                GeneralElement(Vpeak, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "energy":
                GeneralElement(Energy, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);

                break;
            case "frequency":
                GeneralElement(Frequency, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);

                break;

        }
    }
    var elements = { "Attributes": name, "StartNode": StartNode, "EndNode": EndNode, "VPeak": Vpeak, "Energy": Energy, "Frequency": Frequency };
    return elements;
}

function Iac(CMLtag) {
    var name;
    var StartNode = {};
    var EndNode = {};
    var NodeFlag = 0;
    var Ipeak = {};
    var Energy = {};
    var Frequency = {};
    //alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        // alert("Node Name ");
        // alert(element.nodeName);

        switch (element.nodeName.toLowerCase()) {
            case "iac":
                name = element.attributes.name;
                break;
            case "point":
                switch (NodeFlag) {
                    case 0:
                        GeneralNode(StartNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    case 1:
                        GeneralNode(EndNode, element.attributes.row, element.attributes.col, IDCount++);
                        NodeFlag++;
                        break;
                    default:

                }
                break;
            case "ipeak":
                GeneralElement(Ipeak, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);
                break;
            case "energy":
                GeneralElement(Energy, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);

                break;
            case "frequency":
                GeneralElement(Frequency, element.attributes.name, element.attributes.value, element.attributes.unit, element.attributes.prefix);

                break;

        }
    }
    var elements = { "Attributes": name, "StartNode": StartNode, "EndNode": EndNode, "IPeak": Ipeak, "Energy": Energy, "Frequency": Frequency };
    return elements;
}

function OhmMeter(CMLtag) {
    var Oattributes = {};
    var startNode = {};
    var endNode = {};
    //alert(CMLtag);
    var temp = "(" + CMLtag + ")";
    var CMLtag2 = eval(temp);
    // alert(CMLtag2);
    for (var i = 0; i < CMLtag2.length; i++) {
        var element = CMLtag2[i];
        //  alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName) {
            case "OhmMeter":
                GeneralType(Oattributes, element.attributes.name, element.attributes.value);
                break;
            case "point":
                if (i % 2 == 0) {
                    GeneralNode(startNode, element.attributes.row, element.attributes.col, IDCount++)
                }
                else {
                    GeneralNode(endNode, element.attributes.row, element.attributes.col, IDCount++)
                }
                break;
            default:
        }
    }
    var elements = { "Attributes": Oattributes, "StartNode": startNode, "EndNode": endNode };
    return elements;
}

function PoweMeter(CMLtag) {
    var PMattributes = {};
    var startNode = {};
    var endNode = {};
    // alert(CMLtag);

    var temp = "(" + CMLtag + ")";
    var CMLtag2 = eval(temp);

    // alert(CMLtag2);
    for (var i = 0; i < CMLtag2.length; i++) {
        var element = CMLtag2[i];
        //  alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "powemeter ":
                GeneralType(PMattributes, element.attributes.name, element.attributes.value);
                // alert("Name :" + ":" + PMattributes.Name);
                //  alert("Value :" + ":" + PMattributes.Value);


                //Rattributes.Value = element.attributes.value;
                break;
            case "point":
                if (i % 2 == 0) {

                    GeneralNode(startNode, element.attributes.row, element.attributes.col, IDCount++)
                    // alert("ROW");
                    // alert(element.attributes.row);
                    //  alert("cOL");

                    // alert(element.attributes.col);
                }
                else {

                    GeneralNode(endNode, element.attributes.row, element.attributes.col, IDCount++)
                    //  alert("ROW");

                    // alert(element.attributes.row);
                    // alert("cOL");

                    // alert(element.attributes.col);


                }
                break;
            default:

        }
    }
    var PMElements = { "PMattributes": PMattributes, "startNode": startNode, "endNode": endNode };
    // alert(PMElements);
    return PMElements;

}

function Voltameter(CMLtag) {
    var VMattributes = {};
    var startNode = {};
    var endNode = {};
    //alert(CMLtag);

    var temp = "(" + CMLtag + ")";
    var CMLtag2 = eval(temp);

    // alert(CMLtag2);
    for (var i = 0; i < CMLtag2.length; i++) {
        var element = CMLtag2[i];
        //   alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName) {
            case "voltameter":
                GeneralType(VMattributes, element.attributes.name, element.attributes.value);
                //  alert("Name :" + ":" + VMattributes.Name);
                //  alert("Value :" + ":" + VMattributes.Value);


                //Rattributes.Value = element.attributes.value;
                break;
            case "point":
                if (i % 2 == 0) {

                    GeneralNode(startNode, element.attributes.row, element.attributes.col, IDCount++)
                    // alert("ROW");
                    //  alert(element.attributes.row);
                    //  alert("cOL");

                    //    alert(element.attributes.col);
                }
                else {

                    GeneralNode(endNode, element.attributes.row, element.attributes.col, IDCount++)
                    // alert("ROW");

                    // alert(element.attributes.row);
                    // alert("cOL");

                    // alert(element.attributes.col);


                }
                break;
            default:

        }
    }
    var VMElements = { "VMattributes": VMattributes, "startNode": startNode, "endNode": endNode };
    // alert(VMElements);
    return VMElements;

}

function LED(CMLtag) {
    var name = {};
    var Positive = {};
    var Negative = {};
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    //alert(CMLtag);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //alert(element);
        // element = jQuery.parseJSON(element);
        // element = element.evalJSON();
        //  alert("Node Name ");
        //  alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "led":
                name = element.attributes.name;
                break;
            case "positive":
                GeneralNode(Positive, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case "negative":
                GeneralNode(Negative, element.attributes.row, element.attributes.col, IDCount++);

                break;

        }
    }
    var elements = { "Attributes": name, "PositiveNode": Positive, "NegativeNode": Negative };
    return elements;
}

function Diode(CMLtag) {
    var DiodeAtt = {};
    var Anode = {};
    var Cathode = {};
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);

    // alert(CMLtag2);
    for (var i = 0; i < CMLtag.length; i++) {
        var element = CMLtag[i];
        //alert(element);
        // element = jQuery.parseJSON(element);
        // element = element.evalJSON();
        // alert("Node Name ");
        // alert(element.nodeName);
        switch (element.nodeName.toLowerCase()) {
            case "diode":
                GeneralTypeForC(DiodeAtt, element.attributes.name, element.attributes.type);
                break;
            case "anode":
                GeneralNode(Anode, element.attributes.row, element.attributes.col, IDCount++);
                break;
            case "cathode":
                GeneralNode(Cathode, element.attributes.row, element.attributes.col, IDCount++);
                break;
        }
    }
    var elements = { "Attributes": DiodeAtt, "Cathode": Cathode, "Anode": Anode };
    return elements;

}

function GeneralElement(JSONObj, _Name, _Value, _Unit, _Prefix) {
    JSONObj.Name = _Name;
    //alert(JSONObj.Name);
    JSONObj.Value = _Value;
    //alert(JSONObj.Value);
    JSONObj.Unit = _Unit;
    //alert(JSONObj.Unit);
    JSONObj.Prefix = _Prefix;
    //alert(JSONObj.Prefix);
}

function GeneralNode(JSONObj, _Row, _Col, _ID) {
    JSONObj.Row = _Row;
    //alert(JSONObj.Row);
    JSONObj.Col = _Col;
    //alert(JSONObj.Col);
    JSONObj.ID = _ID;
    //alert(JSONObj.ID);
}

function GeneralR(JSONObj, _Name, _Type, _Value, _Unit, _Prefix) {
    JSONObj.Name = _Name;
    // alert(JSONObj.Name);
    JSONObj.Type = _Type;
    // alert(JSONObj.Type);
    JSONObj.Value = _Value;
    //  alert(JSONObj.Value);
    JSONObj.Unit = _Unit;
    //alert(JSONObj.Unit);
    JSONObj.Prefix = _Prefix;
    // alert(JSONObj.Prefix);
}

function GeneralPoint(JSONObj, _Name, _Value, _Prefix) {
    JSONObj.Name = _Name;
    //alert(JSONObj.Name);
    JSONObj.Value = _Value;
    //alert(JSONObj.Value);
    JSONObj.Prefix = _Prefix;
    //alert(JSONObj.Prefix);
}

function GeneralThrow(JSONObj, _State, _Row, _Col, _ID) {
    JSONObj.Row = _Row;
    // alert(JSONObj.Row);
    JSONObj.Col = _Col;
    // alert(JSONObj.Col);
    JSONObj.State = _State;
    // alert(JSONObj.State);
    JSONObj.ID = _ID;
    // alert(JSONObj.ID);
}

function GeneralType(JSONObj, _Name, _Value) {
    JSONObj.Name = _Name;
    //  alert(JSONObj.Name);
    JSONObj.Value = _Value;
    // alert(JSONObj.Value);
}

function GeneralTypeForC(JSONObj, _Name, _Typt) {
    JSONObj.Name = _Name;
    // alert(JSONObj.Name);
    JSONObj.Type = _Typt;
    // alert(JSONObj.Type);
}

//************************Drawing***************************************

function ElementNumInCML(CMLID) {
    var elementNo = $("<div>").prepend($("#" + CMLID).children()).length; // kam element mawgoda gwa taget el circuit
    // alert("children");
    // alert(elementNo + 1);
    return elementNo + 1;
}

function CMLTagNum(txtXML, CMLID) {
    var elementNo = $(txtXML).prepend($("#" + CMLID)).length // kam taget circuit mawgoda f el body
    return elementNo;
}

function ParseHTMLToJSON(elem) {
    var CMLtag = {};
    var saveElements = [];
    var test = "";
    test = $("<div>").prepend(elem).html();
    //  $(function ($) {
    var all = {};
    (function (app) {
        app.init = function () {
            app.oxml = $($.parseXML(test));
        };
        app.getAll = function () {
            return app.oxml.find('*').map(function (v, i) {
                var ux = {};
                $.each(this.attributes, function (index, node) {
                    ux[node.nodeName] = node.nodeValue;
                });
                return $.extend({}, { nodeName: this.nodeName }, { attributes: ux });
            })
            .get();
        };
    })(all);

    all.init();
    CMLtag = JSON.stringify(all.getAll());

    // });

    //alert(" CMLTag"+ CMLtag);
    return CMLtag;
}

function ElementName(CMLtag) {
    var temp = "(" + CMLtag + ")";
    CMLtag = eval(temp);
    var element = CMLtag[0];
    return (element.nodeName);
}

function Element(CMLTag, num, CMLID) {
    var element = $(($("#" + CMLID).children())[num]).html();
    // alert(element);
    return element;
}

function ReadTextFile(schema) {
    var allText;
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", schema, false);
    rawFile.onreadystatechange = function () {
        if (rawFile.readyState === 4) {
            if (rawFile.status === 200 || rawFile.status == 0) {
                allText = rawFile.responseText;
            }
        }
    }

    rawFile.send(null);
    // alert(allText);
    return allText;
}

function GetCMLTag(CMLID) {
    var tag = $("<div>").prepend($("#" + CMLID)).html();
    //validator= validator.replace('"', '');
    return tag;
}

function Validate(txtXML) {
    var validator = validateXML(txtXML, ReadTextFile("Schema.xsd"));
    //alert("XML " + txtXML);
    //alert(validator);
    return validator;
}

function Split(str) {
    // 1 => xml valide 
    //0 => xml invalide
    var test = str.split('.xml');
    var state = 0;
    if (test[1].toLocaleLowerCase().trim() == "validates") {
        state = 1;
    }
    //alert(state);
    return (state);
}

function ElementNumInHTML(CMLID) {
    var elementNum = $("#" + CMLID).children().length; // kam element mawgoda taget el circuit
    return elementNum;
}

function getCircuitElemArr(CMLID) {
    var elem = $("#" + CMLID).children();
    return elem;
    //  alert(elem);
}

function ElementNumInCMLEditor(divID, CMLID, txtID) {
    var elementNo;
    if (txtID != undefined) {
        //if (GetFunParameterNum(DrawCircuit) == 3) {
        //alert("i'm here");
        //alert("in Function ");
        //alert("text Value "+ txtID.value);
        var CML1 = txtID.value;
        //alert(CML1);
        $("#" + divID).html(CML1);

    }
    //alert(document.getElementById("CMLTags").innerHTML);
    elementNo = $("#" + CMLID).children().length; // kam element mawgoda taget el circuit
    //alert("children");
    // alert(elementNo);
    return elementNo;
}

function Final(txtXML, elementNum, validator, ElementsArr, Scale, CMLID) {
    var validate = Validate(validator);
    var state = Split(validate);
    //alert(state);
    var JSONObj;
    switch (state) {
        case 1:
            var num = CMLTagNum(txtXML, CMLID);
            switch (num) {
                case 1:
                    for (var i = 0; i < elementNum; i++) {
                        JSONObj = {};
                        JSONObj = ParseHTMLToJSON(ElementsArr[i]);
                        var CMLtag = ElementName(JSONObj);
                        switch (CMLtag.toLocaleLowerCase()) {

                            case "c":
                                var obj = C(JSONObj);
                                //X,Y
                                var Y1 = parseInt(obj.Anode["Row"]);
                                var X1 = parseInt(obj.Anode["Col"]);
                                var Y2 = parseInt(obj.Cathode["Row"]);
                                var X2 = parseInt(obj.Cathode["Col"]);

                                SaveElementsinArr.push(obj);

                                switch (obj.Attributes["Type"].toLocaleLowerCase()) {
                                    case "chemical":
                                        draw.Capacitor((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "variablechemical":
                                        draw.VarCapacitor((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "bipolar":
                                        draw.PolarizedCapacitor((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "variablebipolar":
                                        draw.VarPolarizedCapacitor((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    default:

                                }
                                break;
                            case "l":
                                var obj = L(JSONObj);
                                SaveElementsinArr.push(obj);


                                break;
                            case "r":
                                var obj = R(JSONObj);
                                var Y1 = parseInt(obj.StartNode["Row"]);
                                var X1 = parseInt(obj.StartNode["Col"]);
                                var Y2 = parseInt(obj.EndNode["Row"]);
                                var X2 = parseInt(obj.EndNode["Col"]);

                                SaveElementsinArr.push(obj);
                                SaveXYofElements.push({ "Category": "R", "X1": X1, "Y1": Y1, "X2": X2, "X2": X2, "Y2": Y2, "Name": obj.Attributes["Name"], "ID1": 0, "ID2": 0, "X1plusY1": 0, "X2plusY2": 0, "Value": obj.Attributes["Value"], "Prefix": obj.Attributes["Prefix"], "I": obj.I, "V": obj.V });
                                //alert("test "+SaveXYofElements[i].X1);
                                switch (obj.Attributes["Type"].toLocaleLowerCase()) {
                                    case "constant":
                                        draw.Resistor((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "variable":
                                        draw.VarResistor((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));

                                        break;
                                }

                                break;
                                //***********************************************************************************************************************

                            case "vdc":
                                var obj = Vdc(JSONObj);
                                var Y1 = parseInt(obj.PositiveNode["Row"]);
                                var X1 = parseInt(obj.PositiveNode["Col"]);
                                var Y2 = parseInt(obj.NegativeNode["Row"]);
                                var X2 = parseInt(obj.NegativeNode["Col"]);


                                SaveElementsinArr.push(obj);
                                SaveXYofElements.push({ "Category": "VDC", "X1": X1, "Y1": Y1, "X2": X2, "X2": X2, "Y2": Y2, "Name": obj.Attributes["Name"], "ID1": 0, "ID2": 0, "X1plusY1": 0, "X2plusY2": 0 });

                                draw.DCVoltageSource((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                break;
                                //***********************************************************************************************************************
                            case "idc":
                                var obj = Idc(JSONObj);
                                var Y1 = parseInt(obj.PositiveNode["Row"]);
                                var X1 = parseInt(obj.PositiveNode["Col"]);
                                var Y2 = parseInt(obj.NegativeNode["Row"]);
                                var X2 = parseInt(obj.NegativeNode["Col"]);
                                SaveElementsinArr.push(obj);
                                SaveXYofElements.push({ "Category": "IDC", "X1": X1, "Y1": Y1, "X2": X2, "X2": X2, "Y2": Y2, "Name": obj.Attributes["Name"], "ID1": 0, "ID2": 0, "X1plusY1": 0, "X2plusY2": 0 });

                                draw.DCCurrentSource((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                break;
                            case "led":


                                var obj = LED(JSONObj);

                                var Y1 = parseInt(obj.PositiveNode["Row"]);
                                var X1 = parseInt(obj.PositiveNode["Col"]);
                                var Y2 = parseInt(obj.NegativeNode["Row"]);
                                var X2 = parseInt(obj.NegativeNode["Col"]);

                                SaveElementsinArr.push(obj);

                                draw.LED((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale), "Red");
                                break;
                            case "connector":
                                var obj = Connector(JSONObj);

                                var Y1 = parseInt(obj.StartNode["Row"]);
                                var X1 = parseInt(obj.StartNode["Col"]);
                                var Y2 = parseInt(obj.EndNode["Row"]);
                                var X2 = parseInt(obj.EndNode["Col"]);

                                SaveElementsinArr.push(obj);
                                SaveXYofElements.push({ "Category": "Connector", "X1": X1, "Y1": Y1, "X2": X2, "Y2": Y2, "Name": obj.Attributes, "ID1": 0, "ID2": 0, "X1plusY1": 0, "X2plusY2": 0 });

                                draw.Wire((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale), "Blue");
                                break;
                            case "and":
                                var obj = Gate(JSONObj, "and");

                                //var X1 =
                                //var Y1=
                                //var X2=
                                //var Y2=

                                SaveElementsinArr.push(obj);

                                break;
                            case "or":
                                var obj = Gate(JSONObj, "or");

                                //var X1 =
                                //var Y1=
                                //var X2=

                                //var Y2=
                                SaveElementsinArr.push(obj);

                                // drawOR(parseInt(obj.Input["InputNode1"].Row), parseInt(obj.Input["InputNode1"].Col),parseInt(obj.Input["InputNode2"].Row), parseInt(obj.Input["InputNode2"].Col), parseInt(obj.Output["Row"]), parseInt(obj.Output["Col"]));
                                break;
                            case "nand":
                                var obj = Gate(JSONObj, "nand");

                                //var X1 =
                                //var Y1=
                                //var X2=
                                //var Y2=

                                SaveElementsinArr.push(obj);


                                break;
                            case "nor":
                                var obj = Gate(JSONObj, "nor");

                                //var X1 =
                                //var Y1=
                                //var X2=
                                //var Y2=

                                SaveElementsinArr.push(obj);

                                //drawNOR(parseInt(obj.Input["InputNode1"].Row), parseInt(obj.Input["InputNode1"].Col), parseInt(obj.Input["InputNode1"].Row), parseInt(obj.Input["InputNode2"].Row), parseInt(obj.Input["InputNode2"].Col), parseInt(obj.Output["Row"]), parseInt(obj.Output["Col"]));

                                break;
                            case "xor":
                                var obj = Gate(JSONObj, "xor");
                                SaveElementsinArr.push(obj);


                                break;
                            case "xnor":
                                var obj = Gate(JSONObj, "xnor");
                                SaveElementsinArr.push(obj);

                                break;
                            case "not":
                                var obj = Not(JSONObj);
                                SaveElementsinArr.push(obj);

                                //drawNOT(parseInt(obj.Input["Row"]), parseInt(obj.Input["Col"]), parseInt(obj.Output["Row"]), parseInt(obj.Output["Col"]));
                                break;
                            case "diode":
                                var obj = Diode(JSONObj);

                                var Y1 = parseInt(obj.Anode["Row"]);
                                var X1 = parseInt(obj.Anode["Col"]);
                                var Y2 = parseInt(obj.Cathode["Row"]);
                                var X2 = parseInt(obj.Cathode["Col"]);

                                SaveElementsinArr.push(obj);

                                //alert(X1 = + "Row" + obj.Anode["Row"] + ", Y1 = " + obj.Anode["Row"] + " , X2 = " + obj.Cathode["Row"] + ", Y2 = " + obj.Cathode["Col"]);
                                switch (obj.Attributes["Type"].toLocaleLowerCase()) {
                                    case "photodiode":
                                        draw.PhotoDiode((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale), "Red");
                                        break;
                                    case "pindiode":
                                        draw.PINdiode((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "tunneldiode":
                                        draw.TunnelDiode((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "schottydiode":
                                        draw.SchottyDiode((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "constatntcurrentdiode":
                                        draw.ConstCurrentDiode((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    case "varactordiode":
                                        //////////////////////////////////////////
                                        draw.VaractorDiode((X1 * Scale), (Y1 * Scale), (X2 * Scale), (Y2 * Scale));
                                        break;
                                    default:

                                }
                                break;
                            case "switch":
                                var obj = Switch(JSONObj);
                               
                                var Y1 =parseInt(obj.Poles[0].FirstPole["Row"]);
                                var X1 =parseInt( obj.Poles[0].FirstPole["Col"]);

                                var Y2 = parseInt(obj.Poles[1].SecondPole["Row"]);
                                var X2=parseInt(obj.Poles[1].SecondPole["Col"]);
                                
                                var Y3=parseInt(obj.Throw[0].FirstThrow["Row"]);
                                var X3 = parseInt(obj.Throw[0].FirstThrow["Col"]);

                                var Y4 = parseInt(obj.Throw[1].SecondThrow["Row"]);
                                var X4 = parseInt(obj.Throw[1].SecondThrow["Row"]);
                                switch (obj.Attributes["Type"].toLocaleLowerCase())
                                {
                                    
                                    case "spst":
                                       // alert("X1: " + (X1 * Scale) + "\t Y1: " + (Y1 * Scale) + "\t X2:" + (X3 * Scale) + "\t Y2:" + (Y3 * Scale));
                                        draw.SPSTSwitch((X1 * Scale), (Y1 * Scale), (X3 * Scale), (Y3 * Scale));
                                       // draw.SPSTSwitch((X3 * Scale), (Y3 * Scale), (X1 * Scale), (Y1 * Scale));

                                        break;

                                    case "dpst":
                                        draw.DPSTSwitch((X1 * Scale), (Y1 * Scale),(X2*Scale),(Y2*Scale),(X3 * Scale), (Y3 * Scale))
                                        break;

                                    case "spdt":
                                        draw.DPSTSwitch((X1 * Scale), (Y1 * Scale), (X3 * Scale), (Y3 * Scale), (X4 * Scale), (Y4 * Scale))

                                        break;


                                    default:

                                }
                                SaveElementsinArr.push(obj);

                                break;
                            case "ohmmeter":
                                var obj = OhmMeter(JSONObj);
                                SaveElementsinArr.push(obj);


                                break;
                            case "voltameter":
                                var obj = Voltameter(JSONObj);
                                SaveElementsinArr.push(obj);

                                break;
                            case "powermeter":
                                var obj = PoweMeter(JSONObj);
                                SaveElementsinArr.push(obj);

                                break;
                            case "vac":
                                var obj = Vac(JSONObj);
                                SaveElementsinArr.push(obj);

                                break;
                            case "iac":
                                var obj = Iac(JSONObj)
                                SaveElementsinArr.push(obj);

                                break;
                            default:
                            case "transistor":
                                var obj = Transistor(JSONObj);
                                SaveElementsinArr.push(obj);

                                break;
                            case "calculate":
                                RCalculations();
                                break
                        }
                    }
                    break;
                default:

            }
            break;
        case 0:

            alert("Invalide XML");
            break;
        default:

    }
}

function CreateDiv(divClassName) {
    var divTag = document.createElement("div");
    // divTag.id = divID;
    divTag.classNamedivClassName;
}

function DrawCircuit(divID, CMLID, txtID) {
    var elementNum = ElementNumInCMLEditor(divID, CMLID);
    var att = GetCMLAtt(CMLID);
    initializeSVG(divID, att["Width"], att["Height"]);
    var scale = parseFloat(att["Scale"]);
    ////////////////////////////////////////////////////
    //
   // alert("scale" + scale);
    var DivAtt = GetDivArributes(divID);
    drawGrid(0, 0, att["Width"], att["Height"], scale);
    var CMLSartPoint = CMLStartPoint(att, DivAtt);
    //alert("befor draw grid");
    //drawGrid(DivAtt["X"] ,DivAtt["Y"], att["Width"], att["Height"], scale);
    //alert("After draw grid");
    var elementArr = $("#" + CMLID).children();
    Final("<div>", elementNum, GetCMLTag(CMLID), elementArr, scale, CMLID);
}

function Drawing(divID, txtID) {
    //GetCMLAttInASP();
    var CMLID = GetCMLID(divID, txtID);
    DrawCircuit(divID, CMLID, txtID);
}

function GetCMLID(divID, txtID) {

    var ID
    var CML1 = txtID.value;

    $("#" + divID).html(CML1);
    var arr = $("cml").get(0).attributes;

    for (var i = 0; i < arr.length; i++) {
        if (arr[i].name == "id") {
            ID = arr[i].value;
            //alert("ID = "+ID );
        }
    }

    return ID;
}

function GetCMLAtt(CMLID) {

    var flag = 0;
    var CMLAtt = {};
    var arr = $("#" + CMLID).get(0).attributes;
    //alert(arr[0]);
    var Height;
    var Width;
    var ID;
    var Scale;
    for (var i = 0; i < arr.length; i++) {
        switch (arr[i].name) {

            case "height":
                Height = arr[i].value;
                break;
            case "width":
                Width = arr[i].value;
                break;
            case "id":
                ID = arr[i].value;
                break;

            case "scale":
                Scale = arr[i].value;
                break;
        }
    }

    CMLAtt = { "Height": Height, "Width": Width, "ID": ID, "Scale": Scale };
    return CMLAtt;
}

function GetCMLAttInASP() {

    var flag = 0;
    var CMLAtt = {};

    var inputs = document.getElementsByTagName("cml");
    alert("test");
    for (var i = 0; i < inputs.length; i++) {
        alert("I'm Here " + inputs[i].id);
    }

    //var arr = $("cml").get(0).attributes;

    //var Height;
    //var Width;
    //var ID;
    //var Scale;
    //for (var i = 0; i < arr.length; i++) {
    //    switch (arr[i].name) {

    //        case "height":
    //            Height = arr[i].value;
    //            break;
    //        case "width":
    //            Width = arr[i].value;
    //            break;
    //        case "id":
    //            ID = arr[i].value;
    //        case "scale":
    //            Scale = arr[i].value;
    //    }
    //}

    //CMLAtt = { "Height": Height, "Width": Width, "ID": ID, "Scale": Scale };
    //return CMLAtt;
}


function GetDivArributes(DIVID) {
    var CMLAtt = {};
    var arr = $("#" + DIVID).position();
    var height = $("#" + DIVID).height();
    var width = $("#" + DIVID).width();

    //  alert("Div Start Point  X=" + arr.left + " , Y= " + arr.top + " , width " + width + " , height " + height);
    var divAtt = { "X": arr.left, "Y": arr.top, "Width": width, "Height": height };
    return divAtt;
}


function CMLStartPoint(CMLatt, Divatt) {
    var CMLHeight = CMLatt["Height"];
    var CMLWidth = CMLatt["Width"];

    var DivWidth = Divatt["Width"];
    var DivHeight = Divatt["Height"];

    var DivLeft = Divatt["X"];
    var DivTop = Divatt["Y"];
    var freeX = (DivWidth - CMLWidth) / 2;
    var freeY = (DivHeight - CMLHeight) / 2;

    var startPointX = DivLeft + freeX;
    var startPointY = DivTop + freeY;

    return { "X": startPointX, "Y": startPointY };
}



//************************Calculations***************************************

function CalcXplusY(SaveXYofElements) {
    for (var i = 0; i < SaveXYofElements.length; i++) {
        SaveXYofElements[i].X1plusY1 = SaveXYofElements[i].X1 + SaveXYofElements[i].Y1;
        //alert("X= " + SaveXYofElements[i].X1 + " , Y= " + SaveXYofElements[i].Y1 + " , X1+Y1 = " + SaveXYofElements[i].X1plusY1);

        SaveXYofElements[i].X2plusY2 = SaveXYofElements[i].X2 + SaveXYofElements[i].Y2;
        //alert("X = " + SaveXYofElements[i].X2 + " , Y= " + SaveXYofElements[i].Y2 + " , X2+Y2 = " + SaveXYofElements[i].X2plusY2);

    }
}

function RCalculations() {
    CalcXplusY(SaveXYofElements);
    var ret = MaxPoint(SaveXYofElements);
    var Connectors = ConnectorsArr(SaveXYofElements);
    //alert("Max Point = " + ret.Max);
    //for (var i = 0; i < SaveXYofElements.length; i++) {
    //    alert("Category : " + SaveXYofElements[i].Category + " , Name = " +SaveXYofElements[i].Name + " , X1 = " + SaveXYofElements[i].X1 + ", Y1 = " + SaveXYofElements[i].Y1 + ", X2 = " + SaveXYofElements[i].X2 + ", Y2 = " + SaveXYofElements[i].Y2 + " , X1+Y1= " + SaveXYofElements[i].X1plusY1 + " , X2+Y2= " + SaveXYofElements[i].X2plusY2);
    //}
    RemoveConnectors(Connectors, SaveXYofElements);
    //alert("After Remove Connectors ");

    //for (var i = 0; i < SaveXYofElements.length; i++)
    //{
    //    alert("Category : " + SaveXYofElements[i].Category + " , Name = " + SaveXYofElements[i].Name + " , X1 = " + SaveXYofElements[i].X1 + ", Y1 = " + SaveXYofElements[i].Y1 + ", X2 = " + SaveXYofElements[i].X2 + ", Y2 = " + SaveXYofElements[i].Y2 + " , X1+Y1= " + SaveXYofElements[i].X1plusY1 + " , X2+Y2= " + SaveXYofElements[i].X2plusY2);
    //}

    //Give All Elements IDs
    GetAllElementsId(SaveXYofElements);
    //for (var i = 0; i < SaveXYofElements.length; i++) {
    //    alert("Category : " + SaveXYofElements[i].Category + " , Name = " + SaveXYofElements[i].Name + " , ID1 = " + SaveXYofElements[i].ID1 + " , ID2 = " + SaveXYofElements[i].ID2);
    //}
    CalcRt(SaveXYofElements);

}

function MaxPoint(SaveXYofElements) {
    var maxX1Y1 = SaveXYofElements[0];

    var maxX2Y2 = SaveXYofElements[0];
    var ret;
    for (var i = 1; i < SaveXYofElements.length; i++) {
        if (maxX1Y1.X1plusY1 == SaveXYofElements[i].X1plusY1) {
            //alert("I'm == 1 ");
            if ((maxX1Y1.X1 < SaveElementsinArr[i].X1) || (maxX1Y1.Y1 < SaveElementsinArr[i].Y1)) {
                maxX1Y1 = SaveXYofElements[i];
                //alert(maxX1Y1.X1 + "" + maxX1Y1.Y1);
            }
        }
            //**************

        else if (maxX1Y1.X1plusY1 < SaveXYofElements[i].X1plusY1) {
            maxX1Y1 = SaveXYofElements[i];
        }
        //********************************************************************************

        if (maxX2Y2.X2plusY2 == SaveXYofElements[i].X2plusY2) {
            //alert("I'm == 2");

            if ((maxX2Y2.X2 < SaveElementsinArr[i].X2) || (maxX2Y2.Y2 < SaveElementsinArr[i].Y2)) {
                maxX2Y2 = SaveXYofElements[i];
                //alert(maxX2Y2.X2 + "" + maxX2Y2.Y2);

            }
        }
            //**************

        else if (maxX2Y2.X2plusY2 < SaveXYofElements[i].X2plusY2) {
            maxX2Y2 = SaveXYofElements[i];
        }

    }

    //********************************************************************************

    if (maxX1Y1.X1plusY1 > maxX2Y2.X2plusY2) {
        ret = { "Max": maxX1Y1.X1plusY1, "In": "X1plusY1", "X": maxX1Y1.X1, "Y": maxX1Y1.Y1, "Name": maxX1Y1.Name, "ID": maxX1Y1.ID1 };
    }
    else if (maxX1Y1.X1plusY1 == maxX2Y2.X2plusY2 && ((maxX1Y1.X1 > maxX2Y2.X2) || (maxX1Y1.Y1 > maxX2Y2.Y2))) {
        ret = { "Max": maxX1Y1.X1plusY1, "In": "X1plusY1", "X": maxX1Y1.X1, "Y": maxX1Y1.Y1, "Name": maxX1Y1.Name, "ID": maxX1Y1.ID1 };

    }
    else {
        ret = { "Max": maxX2Y2.X2plusY2, "In": "X2plusY2", "X": maxX2Y2.X2, "Y": maxX2Y2.Y2, "Name": maxX2Y2.Name, "ID": maxX2Y2.ID2 };
    }
    //alert("max = " + ret.Max + " , X= " + ret.X + " , Y= " + ret.Y +", Name "+ret.Name) ;
    return ret;
    //var max = Math.max(maxX1Y1, maxX2Y2);
    //alert(max);
    //return max;

}

function RemoveConnectors(ConnectorsArr, AllElements) {
    var indexinConnectorsArray;
    var indexInElementsArray;
    while (ConnectorsArr.length > 0) {
        var maxPoint = MaxPoint(ConnectorsArr);

        indexinConnectorsArray = ArrayObjectIndexOf(ConnectorsArr, maxPoint.Max, maxPoint.In);
        indexInElementsArray = ArrayObjectIndexOf(SaveXYofElements, maxPoint.Name, "Name")

        var XYvalue = GetXYofObj(ConnectorsArr, indexinConnectorsArray, maxPoint);
        var samePointsArr = SamePointValue(ConnectorsArr, XYvalue.X, XYvalue.Y);
        var anotherSamePoints;

        if (samePointsArr.length > 0) {
            for (var i = 0; i < samePointsArr.length; i++) {
                var name = samePointsArr[i].Name;
                // alert("Name= " + name);
                //alert("Element Name = " +name);
                // aro7 ageb el index bta3o mn connector array , w nem el elements array
                indexinConnectorsArray = ArrayObjectIndexOf(ConnectorsArr, name, "Name");
                indexInElementsArray = ArrayObjectIndexOf(AllElements, name, "Name");

                if ((samePointsArr[i].X1 == XYvalue.X) && (samePointsArr[i].Y1 == XYvalue.Y)) {
                    // lazem ageb el same point bta3 x2 , y2 2abl ma3mlaha replace 3alshan a3ml lehom kolohom replace msh lno26a wa7da 
                    anotherSamePoints = SamePointValue(AllElements, samePointsArr[i].X2, samePointsArr[i].Y2, name);
                    var X = samePointsArr[i].X2;
                    var Y = samePointsArr[i].Y2;
                    ReplaceEndWithStart(AllElements, indexInElementsArray, ConnectorsArr, indexinConnectorsArray);
                    ReplaceAnotherSamePoints(anotherSamePoints, ConnectorsArr, AllElements, X, Y, XYvalue);

                }
                if ((samePointsArr[i].X2 == XYvalue.X) && (samePointsArr[i].Y2 == XYvalue.Y)) {
                    // lazem ageb el same point bta3 x2 , y2 2abl ma3mlaha replace 3alshan a3ml lehom kolohom replace msh lno26a wa7da 
                    anotherSamePoints = SamePointValue(SaveXYofElements, samePointsArr[i].X1, samePointsArr[i].Y1, name);
                    var X = samePointsArr[i].X1;
                    var Y = samePointsArr[i].Y1;

                    ReplaceStartWithEnd(AllElements, indexInElementsArray, ConnectorsArr, indexinConnectorsArray);
                    ReplaceAnotherSamePoints(anotherSamePoints, ConnectorsArr, AllElements, X, Y, XYvalue);

                }
                ConnectorsArr.splice(indexinConnectorsArray, 1);

            }
        }
        //PushElementsInArray(anotherSamePoints, samePointsArr);

        //alert("ConnectorsArr.length = "+ConnectorsArr.length);

    }
}

function ReplaceAnotherSamePoints(anotherSamePoints, ConnectorsArr, AllElements, X, Y, XYValue) {
    for (var i = 0; i < anotherSamePoints.length; i++) {
        var name = anotherSamePoints[i].Name;
        var cat = anotherSamePoints[i].Category;
        indexinConnectorsArray = ArrayObjectIndexOf(ConnectorsArr, name, "Name");
        indexInElementsArray = ArrayObjectIndexOf(AllElements, name, "Name");

        //alert("index = "+indexinConnectorsArray);

        if ((anotherSamePoints[i].X1 == X) && (anotherSamePoints[i].Y1 == Y)) {
            if (cat == "Connector") {
                ReplaceX1Y1(XYValue.X, XYValue.Y, AllElements, indexInElementsArray, ConnectorsArr, indexinConnectorsArray);
            }
            else {
                ReplaceX1Y1(XYValue.X, XYValue.Y, AllElements, indexInElementsArray);

            }
        }
        if ((anotherSamePoints[i].X2 == X) && (anotherSamePoints[i].Y2 == Y)) {
            if (cat == "Connector") {
                ReplaceX2Y2(XYValue.X, XYValue.Y, AllElements, indexInElementsArray, ConnectorsArr, indexinConnectorsArray);

            }
            else {
                ReplaceX2Y2(XYValue.X, XYValue.Y, AllElements, indexInElementsArray);

            }
        }
    }

}

function PushElementsInArray(PushedElementsArr, Arr) {
    for (var i = 0; i < PushedElementsArr.length; i++) {
        var found = IsFoundInArray(PushedElementsArr[i].Name, Arr);
        if (found == 0) {
            Arr.push(PushedElementsArr[i]);
        }
    }
}

function IsFoundInArray(name, Arr) {
    for (var i = 0; i < Arr.length; i++) {
        if (Arr[i].Name == name) {
            return 1;
        }
    }
    return 0;
}

function ConnectorsArr(AllElements) {
    var Connectors = [];

    for (var i = 0; i < AllElements.length; i++) {
        if (AllElements[i].Category == "Connector") {
            Connectors.push(SaveXYofElements[i]);
        }
    }
    return Connectors;
}

function ArrayObjectIndexOf(myArray, searchTerm, property) {
    for (var i = 0, len = myArray.length; i < len; i++) {
        if (myArray[i][property] == searchTerm) return i;
    }
    return -1;
}

function ReplaceEndWithStart(SaveXYofElements, indexInElementsArray, ConnectorsArr, indexInConnectorArray) {

    ConnectorsArr[indexInConnectorArray].X2 = ConnectorsArr[indexInConnectorArray].X1;
    ConnectorsArr[indexInConnectorArray].Y2 = ConnectorsArr[indexInConnectorArray].Y1;
    ConnectorsArr[indexInConnectorArray].X2plusY2 = ConnectorsArr[indexInConnectorArray].X1plusY1;

    SaveXYofElements[indexInElementsArray].X2 = SaveXYofElements[indexInElementsArray].X1;
    SaveXYofElements[indexInElementsArray].Y2 = SaveXYofElements[indexInElementsArray].Y1;
    SaveXYofElements[indexInElementsArray].X2plusY2 = SaveXYofElements[indexInElementsArray].X1plusY1;


}

function ReplaceX1Y1(XValue, YValue, AllElements, indexInElementsArray, ConnectorsArr, indexinConnectorsArray) {
    if ((ConnectorsArr != undefined) && (indexinConnectorsArray != undefined) && (indexinConnectorsArray != -1)) {
        // alert("index = " + indexinConnectorsArray);
        ConnectorsArr[indexinConnectorsArray].X1 = XValue //el kema elly hy3mlaha replace;
        ConnectorsArr[indexinConnectorsArray].Y1 = YValue;
        ConnectorsArr[indexinConnectorsArray].X1plusY1 = XValue + YValue;
    }
    AllElements[indexInElementsArray].X1 = XValue;
    AllElements[indexInElementsArray].Y1 = YValue;
    AllElements[indexInElementsArray].X1plusY1 = XValue + YValue;

}

function ReplaceX2Y2(XValue, YValue, AllElements, indexInElementsArray, ConnectorsArr, indexinConnectorsArray) {
    if ((ConnectorsArr != undefined) && (indexinConnectorsArray != undefined) && (indexinConnectorsArray != -1)) {
        ConnectorsArr[indexinConnectorsArray].X2 = XValue //el kema elly hy3mlaha replace;
        ConnectorsArr[indexinConnectorsArray].Y2 = YValue;
        ConnectorsArr[indexinConnectorsArray].X2plusY2 = XValue + YValue;
    }
    AllElements[indexInElementsArray].X2 = XValue;
    AllElements[indexInElementsArray].Y2 = YValue;
    AllElements[indexInElementsArray].X2plusY2 = XValue + YValue;
}

function ReplaceStartWithEnd(SaveXYofElements, indexInElementsArray, ConnectorsArr, indexInConnectorArray) {
    if ((ConnectorsArr != undefined) && (indexInConnectorArray != undefined) && (indexInConnectorArray != -1)) {
        ConnectorsArr[indexInConnectorArray].X1 = ConnectorsArr[indexInConnectorArray].X2;
        ConnectorsArr[indexInConnectorArray].Y1 = ConnectorsArr[indexInConnectorArray].Y2;
        ConnectorsArr[indexInConnectorArray].X1plusY1 = ConnectorsArr[indexInConnectorArray].X2plusY2;
    }
    SaveXYofElements[indexInElementsArray].X1 = SaveXYofElements[indexInElementsArray].X2;
    SaveXYofElements[indexInElementsArray].Y1 = SaveXYofElements[indexInElementsArray].Y2;
    SaveXYofElements[indexInElementsArray].X1plusY1 = SaveXYofElements[indexInElementsArray].X2plusY2;


}

function SamePointValue(ConnectorsArr, X, Y, name) {
    var similarPoints = [];
    for (var i = 0 ; i < ConnectorsArr.length; i++) {
        if ((ConnectorsArr[i].X1 == X) && (ConnectorsArr[i].Y1 == Y) && (ConnectorsArr[i].Name != name)) {
            similarPoints.push(ConnectorsArr[i]);
        }
        if ((ConnectorsArr[i].X2 == X && ConnectorsArr[i].Y2 == Y) && (ConnectorsArr[i].Name != name)) {
            similarPoints.push(ConnectorsArr[i]);
        }
    }
    return similarPoints;
}

function IdsIsReset(AllElements) {
    var counter = 0;
    for (var i = 0; i < AllElements.length; i++) {
        if ((AllElements[i].ID1 == 0) || (AllElements[i].ID2 == 0)) {
            counter++;

        }
    }
    return counter;
}

function GetXYofObj(ConnectorsArr, indexInConnectorArray, Value) {
    var X;
    var Y;
    var ret;
    switch (Value.In) {
        case "X1plusY1":
            X = ConnectorsArr[indexInConnectorArray].X1;
            Y = ConnectorsArr[indexInConnectorArray].Y1;
            break;
        case "X2plusY2":
            var X = ConnectorsArr[indexInConnectorArray].X2;
            var Y = ConnectorsArr[indexInConnectorArray].Y2;
            break;
    }
    ret = { "X": X, "Y": Y };
    return ret;
}

function GetAllElementsId(AllElements) {
    var counter = 1;
    var num = 1;
    var CopyOfAllElementsArr = CopyArr(AllElements);
    var maxPoint = MaxPoint(CopyOfAllElementsArr);
    while (num > 0) {

        var SimilarPoints = SamePointValue(AllElements, maxPoint.X, maxPoint.Y);
        for (var i = 0; i < SimilarPoints.length; i++) {
            objIndex = ArrayObjectIndexOf(AllElements, SimilarPoints[i].Name, "Name");
            if ((AllElements[objIndex].X1 == maxPoint.X) && (AllElements[objIndex].Y1 == maxPoint.Y) && (AllElements[objIndex].ID1 == 0)) {
                AllElements[objIndex].ID1 = counter;
                CopyOfAllElementsArr[objIndex].X1plusY1 = 0;
                // alert("I in for loop = " + i + " , Category = " + AllElements[objIndex].Category + ", Counter = " + counter + " , X = " + AllElements[objIndex].X1 + " , Y = " + AllElements[objIndex].Y1 + " , ID = " + counter);
            }
            if ((AllElements[objIndex].X2 == maxPoint.X) && (AllElements[objIndex].Y2 == maxPoint.Y) && (AllElements[objIndex].ID2 == 0)) {
                AllElements[objIndex].ID2 = counter;
                CopyOfAllElementsArr[objIndex].X2plusY2 = 0;
                // alert("I in for loop = " + i + " , Category = " + AllElements[objIndex].Category + ", Counter = " + counter + " , X = " + AllElements[objIndex].X2 + " , Y = " + AllElements[objIndex].Y2 + " , ID = " + counter);


            }
        }
        counter++;
        num = IdsIsReset(AllElements);
        // alert("num = " + num);
        var flag = 0;
        while (flag == 0) {
            var nextMaxPoint = MaxPoint(CopyOfAllElementsArr);
            if (nextMaxPoint.ID == 0) {
                maxPoint = nextMaxPoint;
                flag = 1;
            }
            //else {
            //    alert("Else");
            //    var index = ArrayObjectIndexOf(SimilarPoints, nextMaxPoint.Name, "Name");
            //    switch (nextMaxPoint.In) {
            //        case "X1plusY1":
            //            SimilarPoints[index].X1plusY1 = 0;
            //            break;
            //        case "X2plusY2":
            //            SimilarPoints[index].X2plusY2 = 0;
            //            break;
            //    }

            //}

        }
    }

}

function CopyArr(Arr) {
    Object.prototype.clone = function () {
        var newObj = (this instanceof Array) ? [] : {};
        for (i in this) {
            if (i == 'clone') continue;
            if (this[i] && typeof this[i] == "object") {
                newObj[i] = this[i].clone();
            } else newObj[i] = this[i]
        } return newObj;
    };
    var CopyArr = Arr.clone();
    return CopyArr;
}

function RemoveConnectorsandShortR(AllElements) {
    var Resistance = [];
    // remove connectors and short circuit resistance
    for (var i = 0; i < AllElements.length; i++) {
        if ((AllElements[i].Category != "VDC") && (AllElements[i].ID1 != AllElements[i].ID2)) {
            Resistance.push({ "Name": AllElements[i].Name, "ID1": AllElements[i].ID1, "ID2": AllElements[i].ID2, "Value": AllElements[i].Value, "Prefix": AllElements[i].Prefix, "I": AllElements[i].I, "V": AllElements[i].V });
        }
    }
    return Resistance;
}

function CheckSeriesOrParallel(StartR1, EndR1, StartR2, EndR2) {
    // flag = 1 => series , 2 => parallel
    var flag = 0;
    if (StartR2 == StartR1) {
        flag++;
    }

    // ------- start , end -------------------------
    if (StartR2 == EndR1) {
        flag++;
    }
    // ------- end , start -------------------------
    if (EndR2 == StartR1) {
        flag++;
    }
    // ------- end , end -------------------------
    if (EndR2 == EndR1) {
        flag++;
    }
    //alert("r" + flag);
    return flag;

}

function ParallelCalculation(R1Value, R2Value) {
    var tempValue = parseFloat(1 / R1Value) + parseFloat(1 / R2Value);
    var value = parseFloat(1 / tempValue);
    return value;
}

function SeriesCalculation(R1Value, R2Value) {
    var value = parseFloat(R1Value) + parseFloat(R2Value);
    return value;
}

function ReplaceIDinSeriesCalc(AllElements, indexR1, indexR2) {
    //start == start
    if (AllElements[indexR1].ID1 == AllElements[indexR2].ID1) {
        AllElements[indexR2].ID1 = AllElements[indexR1].ID2;
    }
        //start == end
    else if (AllElements[indexR1].ID1 == AllElements[indexR2].ID2) {
        AllElements[indexR2].ID2 = AllElements[indexR1].ID2;
    }
        // end == start
    else if (AllElements[indexR1].ID2 == AllElements[indexR2].ID1) {
        AllElements[indexR2].ID1 = AllElements[indexR1].ID1;
    }
        // end == end
    else if (AllElements[indexR1].ID2 == AllElements[indexR2].ID2) {
        AllElements[indexR2].ID2 = AllElements[indexR1].ID1;
    }
    AllElements.splice(indexR1, 1);
}

function SameID(AllElements, ID) {
    var array = [];
    for (var i = 0; i < AllElements.length; i++) {

        if (AllElements[i].ID1 == ID || AllElements[i].ID2 == ID) {
            array.push(AllElements[i]);
        }
    }
    return array;
}

function CalcRt(AllElements) {
    try {



        var Elements = RemoveConnectorsandShortR(AllElements);
        var counter = 0;

        //var id = Math.min(Elements[counter].ID1, Elements[counter].ID2);
        //var IDsArray = SortIDs(AllElements);
        // var id=IDsArray[counter];
        var id = 1;
        while (Elements.length > 1) {

            //id = MinPoint(Elements);
            var sameID = SameID(Elements, id);
            if (sameID.length > 1) {
                var flag;
                if (sameID.length == 2) {
                    flag = CheckSeriesOrParallel(sameID[0].ID1, sameID[0].ID2, sameID[1].ID1, sameID[1].ID2);
                    switch (flag) {
                        case 1:
                            // series 
                            var value = SeriesCalculation(sameID[0].Value, sameID[1].Value);
                            var index1 = ArrayObjectIndexOf(Elements, sameID[0].Name, "Name");
                            var index2 = ArrayObjectIndexOf(Elements, sameID[1].Name, "Name");
                            Elements[index2].Value = value;
                            ReplaceIDinSeriesCalc(Elements, index1, index2);
                            break;


                        case 2:
                            // parallel 
                            var value = ParallelCalculation(sameID[0].Value, sameID[1].Value);
                            var index1 = ArrayObjectIndexOf(Elements, sameID[0].Name, "Name");
                            var index2 = ArrayObjectIndexOf(Elements, sameID[1].Name, "Name");
                            Elements[index2].Value = value;
                            Elements.splice(index1, 1);
                            break;
                        default:

                    }
                    //counter = 0;
                    id++;
                }
                else if (sameID.length > 2) {

                    for (var i = 0; i < sameID.length; i++) {
                        for (var j = i + 1; j < sameID.length; j++) {
                            // alert("I = " + i + " , J= " + j);
                            flag = CheckSeriesOrParallel(sameID[j].ID1, sameID[j].ID2, sameID[i].ID1, sameID[i].ID2);
                            switch (flag) {
                                //el mafrod lw homa msh parallel a3ml skip 
                                case 2:
                                    var value = ParallelCalculation(sameID[i].Value, sameID[j].Value);
                                    var index1 = ArrayObjectIndexOf(Elements, sameID[i].Name, "Name");
                                    var index2 = ArrayObjectIndexOf(Elements, sameID[j].Name, "Name");
                                    if (index1 != -1 && index2 != -1) {
                                        Elements[index2].Value = value;
                                        Elements.splice(index1, 1);
                                    }

                                    //counter = 0;
                                    break;

                                default:
                                    //counter++;
                                    break;
                            }
                        }

                    }
                    id++;
                }
                //if (counter == Elements.length - 1)
                //{
                //    counter++;
                //}
            }

            else {

                var IDArray = SortIDs(Elements);
                id = IDArray[counter];

                counter++;
                var max = MaxPoint(Elements);
                if (counter = max) {
                    counter = 0;
                }
            }
        }
        alert("Rt =    " + Elements[0].Value);
    }
    catch (e) {
        alert("Open Circuit");
    }
}

function MinPoint(SaveXYofElements) {
    var array = CopyArr(SaveXYofElements)
    var MinX1Y1 = array[0];

    var MinX2Y2 = array[0];
    var ret;
    for (var i = 1; i < array.length; i++) {

        if (MinX1Y1.ID1 > array[i].ID1) {
            MinX1Y1.ID1 = array[i].ID1;
        }
        if (MinX1Y1.ID2 > array[i].ID2) {
            MinX2Y2.ID2 = array[i].ID2;
        }
    }
    var min = Math.min(MinX1Y1.ID1, MinX2Y2.ID2);
    return min;
}

function SortIDs(AllElements) {
    var IDs = [];
    for (var i = 0; i < AllElements.length; i++) {
        //if (IDs.((AllElements[i].ID1)) == -1)
        //{
        IDs.push(AllElements[i].ID1);
        //}
        //if (IDs((AllElements[i].ID12)) == -1) {
        IDs.push(AllElements[i].ID2);
        //}
    }
    IDs = IDs.sort(function (a, b) { return a - b });
    //var AllIDs
    //for (var i = 1; i < IDs.length; i++)
    //{
    //    if (IDs[i - 1] != IDs[i])
    //    {
    //        AllIDs.push(IDs[i - 1]);
    //    }
    //}
    //return AllIDs ;
    return IDs;
}