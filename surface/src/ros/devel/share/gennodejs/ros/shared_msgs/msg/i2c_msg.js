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

class i2c_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.addr = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('addr')) {
        this.addr = initObj.addr
      }
      else {
        this.addr = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type i2c_msg
    // Serialize message field [addr]
    bufferOffset = _serializer.uint8(obj.addr, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _serializer.uint64(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type i2c_msg
    let len;
    let data = new i2c_msg(null);
    // Deserialize message field [addr]
    data.addr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/i2c_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b186db14e4c5189ed032baff6e0239ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 addr
    uint64 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new i2c_msg(null);
    if (msg.addr !== undefined) {
      resolved.addr = msg.addr;
    }
    else {
      resolved.addr = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = 0
    }

    return resolved;
    }
};

module.exports = i2c_msg;
