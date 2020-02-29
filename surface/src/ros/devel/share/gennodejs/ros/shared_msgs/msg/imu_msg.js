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

class imu_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gyro = null;
      this.accel = null;
    }
    else {
      if (initObj.hasOwnProperty('gyro')) {
        this.gyro = initObj.gyro
      }
      else {
        this.gyro = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type imu_msg
    // Check that the constant length array field [gyro] has the right length
    if (obj.gyro.length !== 3) {
      throw new Error('Unable to serialize array field gyro - length must be 3')
    }
    // Serialize message field [gyro]
    bufferOffset = _arraySerializer.float32(obj.gyro, buffer, bufferOffset, 3);
    // Check that the constant length array field [accel] has the right length
    if (obj.accel.length !== 3) {
      throw new Error('Unable to serialize array field accel - length must be 3')
    }
    // Serialize message field [accel]
    bufferOffset = _arraySerializer.float32(obj.accel, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type imu_msg
    let len;
    let data = new imu_msg(null);
    // Deserialize message field [gyro]
    data.gyro = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [accel]
    data.accel = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/imu_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ce45cc38daa7ab1aa2192631b286b0ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[3] gyro
    float32[3] accel
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new imu_msg(null);
    if (msg.gyro !== undefined) {
      resolved.gyro = msg.gyro;
    }
    else {
      resolved.gyro = new Array(3).fill(0)
    }

    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = new Array(3).fill(0)
    }

    return resolved;
    }
};

module.exports = imu_msg;
