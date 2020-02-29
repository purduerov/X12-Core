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

class auto_control_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.thrust_vec = null;
      this.dims_locked = null;
    }
    else {
      if (initObj.hasOwnProperty('thrust_vec')) {
        this.thrust_vec = initObj.thrust_vec
      }
      else {
        this.thrust_vec = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('dims_locked')) {
        this.dims_locked = initObj.dims_locked
      }
      else {
        this.dims_locked = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type auto_control_msg
    // Check that the constant length array field [thrust_vec] has the right length
    if (obj.thrust_vec.length !== 6) {
      throw new Error('Unable to serialize array field thrust_vec - length must be 6')
    }
    // Serialize message field [thrust_vec]
    bufferOffset = _arraySerializer.float32(obj.thrust_vec, buffer, bufferOffset, 6);
    // Check that the constant length array field [dims_locked] has the right length
    if (obj.dims_locked.length !== 6) {
      throw new Error('Unable to serialize array field dims_locked - length must be 6')
    }
    // Serialize message field [dims_locked]
    bufferOffset = _arraySerializer.bool(obj.dims_locked, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type auto_control_msg
    let len;
    let data = new auto_control_msg(null);
    // Deserialize message field [thrust_vec]
    data.thrust_vec = _arrayDeserializer.float32(buffer, bufferOffset, 6)
    // Deserialize message field [dims_locked]
    data.dims_locked = _arrayDeserializer.bool(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    return 30;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/auto_control_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '563a60a06dd4f4297aa17e367a4fb89b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[6] thrust_vec
    bool[6] dims_locked
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new auto_control_msg(null);
    if (msg.thrust_vec !== undefined) {
      resolved.thrust_vec = msg.thrust_vec;
    }
    else {
      resolved.thrust_vec = new Array(6).fill(0)
    }

    if (msg.dims_locked !== undefined) {
      resolved.dims_locked = msg.dims_locked;
    }
    else {
      resolved.dims_locked = new Array(6).fill(0)
    }

    return resolved;
    }
};

module.exports = auto_control_msg;
