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

class thrust_command_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desired_thrust = null;
    }
    else {
      if (initObj.hasOwnProperty('desired_thrust')) {
        this.desired_thrust = initObj.desired_thrust
      }
      else {
        this.desired_thrust = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type thrust_command_msg
    // Check that the constant length array field [desired_thrust] has the right length
    if (obj.desired_thrust.length !== 6) {
      throw new Error('Unable to serialize array field desired_thrust - length must be 6')
    }
    // Serialize message field [desired_thrust]
    bufferOffset = _arraySerializer.float32(obj.desired_thrust, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type thrust_command_msg
    let len;
    let data = new thrust_command_msg(null);
    // Deserialize message field [desired_thrust]
    data.desired_thrust = _arrayDeserializer.float32(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/thrust_command_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '799334c773133ce868f5247076316205';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[6] desired_thrust
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new thrust_command_msg(null);
    if (msg.desired_thrust !== undefined) {
      resolved.desired_thrust = msg.desired_thrust;
    }
    else {
      resolved.desired_thrust = new Array(6).fill(0)
    }

    return resolved;
    }
};

module.exports = thrust_command_msg;
