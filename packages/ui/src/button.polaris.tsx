'use client';

// import {ReactNode} from 'react';

interface ButtonProps {
  children?: string | string[];
  className?: string;
  size?: 'medium' | 'large' | 'micro' | 'slim';
  textAlign?: 'start' | 'center' | 'end' | 'left' | 'right';
}

export const Button = (props: ButtonProps) => {
  return <button {...props} />;
};
