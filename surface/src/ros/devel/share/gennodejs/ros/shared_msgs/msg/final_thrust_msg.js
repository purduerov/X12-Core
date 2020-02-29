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

class final_thrust_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hfl = null;
      this.hfr = null;
      this.hbr = null;
      this.hbl = null;
      this.vfl = null;
      this.vfr = null;
      this.vbr = null;
      this.vbl = null;
    }
    else {
      if (initObj.hasOwnProperty('hfl')) {
        this.hfl = initObj.hfl
      }
      else {
        this.hfl = 0;
      }
      if (initObj.hasOwnProperty('hfr')) {
        this.hfr = initObj.hfr
      }
      else {
        this.hfr = 0;
      }
      if (initObj.hasOwnProperty('hbr')) {
        this.hbr = initObj.hbr
      }
      else {
        this.hbr = 0;
      }
      if (initObj.hasOwnProperty('hbl')) {
        this.hbl = initObj.hbl
      }
      else {
        this.hbl = 0;
      }
      if (initObj.hasOwnProperty('vfl')) {
        this.vfl = initObj.vfl
      }
      else {
        this.vfl = 0;
      }
      if (initObj.hasOwnProperty('vfr')) {
        this.vfr = initObj.vfr
      }
      else {
        this.vfr = 0;
      }
      if (initObj.hasOwnProperty('vbr')) {
        this.vbr = initObj.vbr
      }
      else {
        this.vbr = 0;
      }
      if (initObj.hasOwnProperty('vbl')) {
        this.vbl = initObj.vbl
      }
      else {
        this.vbl = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type final_thrust_msg
    // Serialize message field [hfl]
    bufferOffset = _serializer.uint8(obj.hfl, buffer, bufferOffset);
    // Serialize message field [hfr]
    bufferOffset = _serializer.uint8(obj.hfr, buffer, bufferOffset);
    // Serialize message field [hbr]
    bufferOffset = _serializer.uint8(obj.hbr, buffer, bufferOffset);
    // Serialize message field [hbl]
    bufferOffset = _serializer.uint8(obj.hbl, buffer, bufferOffset);
    // Serialize message field [vfl]
    bufferOffset = _serializer.uint8(obj.vfl, buffer, bufferOffset);
    // Serialize message field [vfr]
    bufferOffset = _serializer.uint8(obj.vfr, buffer, bufferOffset);
    // Serialize message field [vbr]
    bufferOffset = _serializer.uint8(obj.vbr, buffer, bufferOffset);
    // Serialize message field [vbl]
    bufferOffset = _serializer.uint8(obj.vbl, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type final_thrust_msg
    let len;
    let data = new final_thrust_msg(null);
    // Deserialize message field [hfl]
    data.hfl = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hfr]
    data.hfr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hbr]
    data.hbr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hbl]
    data.hbl = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vfl]
    data.vfl = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vfr]
    data.vfr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vbr]
    data.vbr = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vbl]
    data.vbl = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/final_thrust_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6ec19b411594e3b47b780fbf91db2d37';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 hfl
    uint8 hfr
    uint8 hbr
    uint8 hbl
    uint8 vfl
    uint8 vfr
    uint8 vbr
    uint8 vbl
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new final_thrust_msg(null);
    if (msg.hfl !== undefined) {
      resolved.hfl = msg.hfl;
    }
    else {
      resolved.hfl = 0
    }

    if (msg.hfr !== undefined) {
      resolved.hfr = msg.hfr;
    }
    else {
      resolved.hfr = 0
    }

    if (msg.hbr !== undefined) {
      resolved.hbr = msg.hbr;
    }
    else {
      resolved.hbr = 0
    }

    if (msg.hbl !== undefined) {
      resolved.hbl = msg.hbl;
    }
    else {
      resolved.hbl = 0
    }

    if (msg.vfl !== undefined) {
      resolved.vfl = msg.vfl;
    }
    else {
      resolved.vfl = 0
    }

    if (msg.vfr !== undefined) {
      resolved.vfr = msg.vfr;
    }
    else {
      resolved.vfr = 0
    }

    if (msg.vbr !== undefined) {
      resolved.vbr = msg.vbr;
    }
    else {
      resolved.vbr = 0
    }

    if (msg.vbl !== undefined) {
      resolved.vbl = msg.vbl;
    }
    else {
      resolved.vbl = 0
    }

    return resolved;
    }
};

module.exports = final_thrust_msg;
