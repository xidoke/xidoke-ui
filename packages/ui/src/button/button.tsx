import * as React from 'react';

import {cn} from '../../helpers.js';
import {getButtonStyling, getIconStyling, TButtonSizes, TButtonVariant} from './helper.js';

export interface ButtonProps extends React.ComponentPropsWithRef<'button'> {
  variant?: TButtonVariant;
  size?: TButtonSizes;
  loading?: boolean;
  disabled?: boolean;
  children: React.ReactNode;
  appendIcon?: any;
  prependIcon?: any;
}

const Button = (props: ButtonProps) => {
  const {
    variant = 'primary',
    size = 'md',
    loading = false,
    disabled = false,
    className,
    children,
    appendIcon = null,
    prependIcon = null,
    ref,
    ...rest
  } = props;

  const buttonStyle = getButtonStyling(variant, size, disabled);

  const buttonIconStyle = getIconStyling(size);

  return (
    <button
      ref={ref}
      className={cn(buttonStyle, className)}
      disabled={disabled || loading}
      {...rest}
    >
      {prependIcon && (
        <div className={buttonIconStyle}>
          {React.cloneElement(prependIcon, {
            strokeWidth: 2,
          })}
        </div>
      )}
      {children}
      {appendIcon && (
        <div className={buttonIconStyle}>
          {React.cloneElement(appendIcon, {
            strokeWidth: 2,
          })}
        </div>
      )}
    </button>
  );
};

export default Button;
