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

class thrust_disable_inverted_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.disable_thrusters = null;
      this.inverted = null;
    }
    else {
      if (initObj.hasOwnProperty('disable_thrusters')) {
        this.disable_thrusters = initObj.disable_thrusters
      }
      else {
        this.disable_thrusters = new Array(8).fill(0);
      }
      if (initObj.hasOwnProperty('inverted')) {
        this.inverted = initObj.inverted
      }
      else {
        this.inverted = new Array(8).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type thrust_disable_inverted_msg
    // Check that the constant length array field [disable_thrusters] has the right length
    if (obj.disable_thrusters.length !== 8) {
      throw new Error('Unable to serialize array field disable_thrusters - length must be 8')
    }
    // Serialize message field [disable_thrusters]
    bufferOffset = _arraySerializer.bool(obj.disable_thrusters, buffer, bufferOffset, 8);
    // Check that the constant length array field [inverted] has the right length
    if (obj.inverted.length !== 8) {
      throw new Error('Unable to serialize array field inverted - length must be 8')
    }
    // Serialize message field [inverted]
    bufferOffset = _arraySerializer.int8(obj.inverted, buffer, bufferOffset, 8);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type thrust_disable_inverted_msg
    let len;
    let data = new thrust_disable_inverted_msg(null);
    // Deserialize message field [disable_thrusters]
    data.disable_thrusters = _arrayDeserializer.bool(buffer, bufferOffset, 8)
    // Deserialize message field [inverted]
    data.inverted = _arrayDeserializer.int8(buffer, bufferOffset, 8)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/thrust_disable_inverted_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8b3d2e54482b6a65fb91c54d0d200315';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[8] disable_thrusters
    int8[8] inverted
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new thrust_disable_inverted_msg(null);
    if (msg.disable_thrusters !== undefined) {
      resolved.disable_thrusters = msg.disable_thrusters;
    }
    else {
      resolved.disable_thrusters = new Array(8).fill(0)
    }

    if (msg.inverted !== undefined) {
      resolved.inverted = msg.inverted;
    }
    else {
      resolved.inverted = new Array(8).fill(0)
    }

    return resolved;
    }
};

module.exports = thrust_disable_inverted_msg;
