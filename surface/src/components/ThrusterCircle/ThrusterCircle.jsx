import React, { Component } from 'react';
import {Card, CardColumns} from 'react-bootstrap';
import '../../styles/Card.css';


export default class ThrusterCircle extends Component {
    constructor(props) {
        super(props);
        this.state = {off: 0 + (props.disable)};

        this.onClick = this.onClick.bind(this);
    }

    onClick(e) {
        this.setState((state, props) => ({off: (1 - state.off)}), function() {
            this.props.rend(this.state.off, this.props.indx);
        });
    }

    render() {
        return(
           <Card className='card-custom'>
               <CardColumns></CardColumns>
                <div
                  className={this.state.off === 0 ? (`${'c100 ' + 'p'}${this.props.val} select thruster-off ${ // thrusters
                        this.props.val > 70 ? 'thruster-red' : this.props.val > 55 ? 'thruster-orange' : 'thruster-green'}`)
                        : `${'c100 ' + 'p'}${this.props.val} thruster-off thruster-grey`} onClick={this.onClick}
                >
                    <span>
                        {this.props.val.toFixed(2)}
%
                    </span>
                    <div className="slice">
                        <div className="bar" />
                        <div className="fill" />
                    </div>
                </div>
            </Card>
        );
    }
}
