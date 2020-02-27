// Auto-generated. Do not edit!

// (in-package shared_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class tools_command_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.manipulator = null;
      this.groutTrout = null;
      this.liftBag = null;
      this.marker = null;
    }
    else {
      if (initObj.hasOwnProperty('manipulator')) {
        this.manipulator = initObj.manipulator
      }
      else {
        this.manipulator = 0;
      }
      if (initObj.hasOwnProperty('groutTrout')) {
        this.groutTrout = initObj.groutTrout
      }
      else {
        this.groutTrout = 0;
      }
      if (initObj.hasOwnProperty('liftBag')) {
        this.liftBag = initObj.liftBag
      }
      else {
        this.liftBag = 0;
      }
      if (initObj.hasOwnProperty('marker')) {
        this.marker = initObj.marker
      }
      else {
        this.marker = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tools_command_msg
    // Serialize message field [manipulator]
    bufferOffset = _serializer.int8(obj.manipulator, buffer, bufferOffset);
    // Serialize message field [groutTrout]
    bufferOffset = _serializer.int8(obj.groutTrout, buffer, bufferOffset);
    // Serialize message field [liftBag]
    bufferOffset = _serializer.int8(obj.liftBag, buffer, bufferOffset);
    // Serialize message field [marker]
    bufferOffset = _serializer.int8(obj.marker, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tools_command_msg
    let len;
    let data = new tools_command_msg(null);
    // Deserialize message field [manipulator]
    data.manipulator = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [groutTrout]
    data.groutTrout = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [liftBag]
    data.liftBag = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [marker]
    data.marker = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/tools_command_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99400b8a44513c5ef4f0bf7e444e5295';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 manipulator
    int8 groutTrout
    int8 liftBag
    int8 marker
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tools_command_msg(null);
    if (msg.manipulator !== undefined) {
      resolved.manipulator = msg.manipulator;
    }
    else {
      resolved.manipulator = 0
    }

    if (msg.groutTrout !== undefined) {
      resolved.groutTrout = msg.groutTrout;
    }
    else {
      resolved.groutTrout = 0
    }

    if (msg.liftBag !== undefined) {
      resolved.liftBag = msg.liftBag;
    }
    else {
      resolved.liftBag = 0
    }

    if (msg.marker !== undefined) {
      resolved.marker = msg.marker;
    }
    else {
      resolved.marker = 0
    }

    return resolved;
    }
};

module.exports = tools_command_msg;
