import React from 'react';
import {Row, Col, Button} from 'react-bootstrap';

class Timer extends React.Component {
    constructor(props){
        super(props)
        this.state = {
            time: 0,
            start: 0,
            offset: 0,
            stime: {'m': '15', 's': '00'},
            isOn: false
        }    
        this.startTimer = this.startTimer.bind(this)
        this.stopTimer = this.stopTimer.bind(this)
        this.resetTimer = this.resetTimer.bind(this)

        this.interval = setInterval(() => {
            // console.log(this.state);
            if (this.state.isOn) {
                this.setState({
                    time: Date.now(),
                    stime: this.secondsToTime(this.state.time)
                });
            }
        }, 50);
    }  
    secondsToTime(s){    
        var timeDisplay;
        if (this.state.isOn) {
            timeDisplay = 15 * 60 -(this.state.time - this.state.start + this.state.offset) / 1000;
        } else {
            timeDisplay = 15 * 60 - this.state.offset / 1000;
        }

        if (timeDisplay <= 0) {
            return ({'m': '00', 's': '00'});
        }

        var minutes = Math.floor(timeDisplay / 60);
        var seconds = Math.floor(timeDisplay % 60);

        var obj = {
            'm': ("0" + minutes).slice(-2),
            's': ("0" + seconds).slice(-2)
        }
        
        return obj;
      }

    startTimer(){
        if(!this.state.isOn){
            this.stateCopy = {
                start: Date.now(),
                offset: this.state.offset,
                time: this.state.time,
                isOn: true
            };
            this.setState(this.stateCopy);
        }
    }

    stopTimer(){
        if(this.state.isOn){
            this.stateCopy = {
                start: 0,
                offset: Date.now() - this.state.start + this.state.offset,
                time: this.state.time,
                isOn: false
            };
            this.setState(this.stateCopy);
        }
    }

    resetTimer(){
        this.stateCopy = {
            start: 0,
            offset: 0,
            time: 0,
            isOn: false,
            stime: {'m': '15', 's': '00'}
        }
        this.setState(this.stateCopy);
    }

	render(){
		return(
			<Row style={{float: 'right'}}>
				<Col className='col-align' style={{fontSize: '1.75rem'}}>
                    {this.state.stime.m}:{this.state.stime.s}
				</Col>
				<Col className='col-align'>
					<Button onClick={this.startTimer} style={{margin: '.5rem'}}>Start</Button>
                    <Button onClick={this.stopTimer} style={{margin: '.5rem'}}>Stop</Button>
                    <Button onClick={this.resetTimer} style={{margin: '.5rem'}}>Reset</Button>
				</Col>
			</Row>
		)
	}
}

export default Timer;