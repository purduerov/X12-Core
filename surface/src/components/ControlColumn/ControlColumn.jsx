import React from 'react';
import './controlcolumn.css';

class ControlColumn extends React.Component {
	constructor(props) {
		super(props);
	}

	render() {
		return (
			<div className='control'>
				{this.state.text}
			</div>
		);
	}
}

export default Titlebar;
