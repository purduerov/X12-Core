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

class thrust_status_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new Array(8).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type thrust_status_msg
    // Check that the constant length array field [status] has the right length
    if (obj.status.length !== 8) {
      throw new Error('Unable to serialize array field status - length must be 8')
    }
    // Serialize message field [status]
    bufferOffset = _arraySerializer.float32(obj.status, buffer, bufferOffset, 8);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type thrust_status_msg
    let len;
    let data = new thrust_status_msg(null);
    // Deserialize message field [status]
    data.status = _arrayDeserializer.float32(buffer, bufferOffset, 8)
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/thrust_status_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3de3e43f639d3c2c12cdae9fac020a2c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[8] status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new thrust_status_msg(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = new Array(8).fill(0)
    }

    return resolved;
    }
};

module.exports = thrust_status_msg;
