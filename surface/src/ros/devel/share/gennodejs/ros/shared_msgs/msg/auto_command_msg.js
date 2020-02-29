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

class auto_command_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stabilization_dim = null;
    }
    else {
      if (initObj.hasOwnProperty('stabilization_dim')) {
        this.stabilization_dim = initObj.stabilization_dim
      }
      else {
        this.stabilization_dim = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type auto_command_msg
    // Check that the constant length array field [stabilization_dim] has the right length
    if (obj.stabilization_dim.length !== 6) {
      throw new Error('Unable to serialize array field stabilization_dim - length must be 6')
    }
    // Serialize message field [stabilization_dim]
    bufferOffset = _arraySerializer.int8(obj.stabilization_dim, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type auto_command_msg
    let len;
    let data = new auto_command_msg(null);
    // Deserialize message field [stabilization_dim]
    data.stabilization_dim = _arrayDeserializer.int8(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/auto_command_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4362e29932548ed2712d3d546a04a23c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8[6] stabilization_dim
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new auto_command_msg(null);
    if (msg.stabilization_dim !== undefined) {
      resolved.stabilization_dim = msg.stabilization_dim;
    }
    else {
      resolved.stabilization_dim = new Array(6).fill(0)
    }

    return resolved;
    }
};

module.exports = auto_command_msg;
