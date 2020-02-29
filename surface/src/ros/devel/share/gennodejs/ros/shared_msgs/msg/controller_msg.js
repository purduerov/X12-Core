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

class controller_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.RX_axis = null;
      this.RY_axis = null;
      this.LX_axis = null;
      this.LY_axis = null;
      this.a = null;
      this.b = null;
      this.x = null;
      this.y = null;
      this.DPadX = null;
      this.DPadY = null;
      this.RB = null;
      this.LB = null;
      this.Rtrigger = null;
      this.Ltrigger = null;
    }
    else {
      if (initObj.hasOwnProperty('RX_axis')) {
        this.RX_axis = initObj.RX_axis
      }
      else {
        this.RX_axis = 0.0;
      }
      if (initObj.hasOwnProperty('RY_axis')) {
        this.RY_axis = initObj.RY_axis
      }
      else {
        this.RY_axis = 0.0;
      }
      if (initObj.hasOwnProperty('LX_axis')) {
        this.LX_axis = initObj.LX_axis
      }
      else {
        this.LX_axis = 0.0;
      }
      if (initObj.hasOwnProperty('LY_axis')) {
        this.LY_axis = initObj.LY_axis
      }
      else {
        this.LY_axis = 0.0;
      }
      if (initObj.hasOwnProperty('a')) {
        this.a = initObj.a
      }
      else {
        this.a = 0;
      }
      if (initObj.hasOwnProperty('b')) {
        this.b = initObj.b
      }
      else {
        this.b = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0;
      }
      if (initObj.hasOwnProperty('DPadX')) {
        this.DPadX = initObj.DPadX
      }
      else {
        this.DPadX = 0;
      }
      if (initObj.hasOwnProperty('DPadY')) {
        this.DPadY = initObj.DPadY
      }
      else {
        this.DPadY = 0;
      }
      if (initObj.hasOwnProperty('RB')) {
        this.RB = initObj.RB
      }
      else {
        this.RB = 0;
      }
      if (initObj.hasOwnProperty('LB')) {
        this.LB = initObj.LB
      }
      else {
        this.LB = 0;
      }
      if (initObj.hasOwnProperty('Rtrigger')) {
        this.Rtrigger = initObj.Rtrigger
      }
      else {
        this.Rtrigger = 0.0;
      }
      if (initObj.hasOwnProperty('Ltrigger')) {
        this.Ltrigger = initObj.Ltrigger
      }
      else {
        this.Ltrigger = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controller_msg
    // Serialize message field [RX_axis]
    bufferOffset = _serializer.float32(obj.RX_axis, buffer, bufferOffset);
    // Serialize message field [RY_axis]
    bufferOffset = _serializer.float32(obj.RY_axis, buffer, bufferOffset);
    // Serialize message field [LX_axis]
    bufferOffset = _serializer.float32(obj.LX_axis, buffer, bufferOffset);
    // Serialize message field [LY_axis]
    bufferOffset = _serializer.float32(obj.LY_axis, buffer, bufferOffset);
    // Serialize message field [a]
    bufferOffset = _serializer.int8(obj.a, buffer, bufferOffset);
    // Serialize message field [b]
    bufferOffset = _serializer.int8(obj.b, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.int8(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int8(obj.y, buffer, bufferOffset);
    // Serialize message field [DPadX]
    bufferOffset = _serializer.int8(obj.DPadX, buffer, bufferOffset);
    // Serialize message field [DPadY]
    bufferOffset = _serializer.int8(obj.DPadY, buffer, bufferOffset);
    // Serialize message field [RB]
    bufferOffset = _serializer.int8(obj.RB, buffer, bufferOffset);
    // Serialize message field [LB]
    bufferOffset = _serializer.int8(obj.LB, buffer, bufferOffset);
    // Serialize message field [Rtrigger]
    bufferOffset = _serializer.float32(obj.Rtrigger, buffer, bufferOffset);
    // Serialize message field [Ltrigger]
    bufferOffset = _serializer.float32(obj.Ltrigger, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controller_msg
    let len;
    let data = new controller_msg(null);
    // Deserialize message field [RX_axis]
    data.RX_axis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [RY_axis]
    data.RY_axis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [LX_axis]
    data.LX_axis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [LY_axis]
    data.LY_axis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [a]
    data.a = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [b]
    data.b = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [DPadX]
    data.DPadX = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [DPadY]
    data.DPadY = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [RB]
    data.RB = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [LB]
    data.LB = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [Rtrigger]
    data.Rtrigger = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Ltrigger]
    data.Ltrigger = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'shared_msgs/controller_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57ec734b5ac6013c2716cfd2d22db9b4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 RX_axis
    float32 RY_axis
    float32 LX_axis
    float32 LY_axis
    int8 a
    int8 b
    int8 x
    int8 y
    int8 DPadX
    int8 DPadY
    int8 RB
    int8 LB
    float32 Rtrigger
    float32 Ltrigger
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controller_msg(null);
    if (msg.RX_axis !== undefined) {
      resolved.RX_axis = msg.RX_axis;
    }
    else {
      resolved.RX_axis = 0.0
    }

    if (msg.RY_axis !== undefined) {
      resolved.RY_axis = msg.RY_axis;
    }
    else {
      resolved.RY_axis = 0.0
    }

    if (msg.LX_axis !== undefined) {
      resolved.LX_axis = msg.LX_axis;
    }
    else {
      resolved.LX_axis = 0.0
    }

    if (msg.LY_axis !== undefined) {
      resolved.LY_axis = msg.LY_axis;
    }
    else {
      resolved.LY_axis = 0.0
    }

    if (msg.a !== undefined) {
      resolved.a = msg.a;
    }
    else {
      resolved.a = 0
    }

    if (msg.b !== undefined) {
      resolved.b = msg.b;
    }
    else {
      resolved.b = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0
    }

    if (msg.DPadX !== undefined) {
      resolved.DPadX = msg.DPadX;
    }
    else {
      resolved.DPadX = 0
    }

    if (msg.DPadY !== undefined) {
      resolved.DPadY = msg.DPadY;
    }
    else {
      resolved.DPadY = 0
    }

    if (msg.RB !== undefined) {
      resolved.RB = msg.RB;
    }
    else {
      resolved.RB = 0
    }

    if (msg.LB !== undefined) {
      resolved.LB = msg.LB;
    }
    else {
      resolved.LB = 0
    }

    if (msg.Rtrigger !== undefined) {
      resolved.Rtrigger = msg.Rtrigger;
    }
    else {
      resolved.Rtrigger = 0.0
    }

    if (msg.Ltrigger !== undefined) {
      resolved.Ltrigger = msg.Ltrigger;
    }
    else {
      resolved.Ltrigger = 0.0
    }

    return resolved;
    }
};

module.exports = controller_msg;
