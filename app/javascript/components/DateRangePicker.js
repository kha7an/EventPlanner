import React, { useState } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import styled from 'styled-components';

const DatePickerWrapper = styled.div`
  .react-datepicker-popper {
    z-index: 10;
  }

  .react-datepicker {
    font-family: 'Arial', sans-serif;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  .react-datepicker__header {
    background-color: #fff;
    border-bottom: none;
    padding: 10px 16px;
  }

  .react-datepicker__current-month {
    font-size: 1.25em;
    font-weight: bold;
  }

  .react-datepicker__day-name, 
  .react-datepicker__day, 
  .react-datepicker__time-name {
    color: #585163;
  }

  .react-datepicker__day:hover {
    background-color: #eee;
  }

  .react-datepicker__day--selected {
    background-color: #3a3247;
    color: white;
  }
`;

const DateRangePicker = () => {
    const [startDate, setStartDate] = useState(null);

    return (
        <DatePickerWrapper>
            <DatePicker
                selected={startDate}
                onChange={date => setStartDate(date)}
                inline
                placeholderText="Выберите дату"
                dateFormat="dd/MM/yyyy"
                popperPlacement="auto"
            />
        </DatePickerWrapper>
    );
};

export default DateRangePicker;
