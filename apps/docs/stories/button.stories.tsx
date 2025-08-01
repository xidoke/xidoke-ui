import type {Meta, StoryObj} from '@storybook/react';
import Button from '@xidoke/ui/button';

const meta: Meta<typeof Button> = {
  component: Button,
  argTypes: {},
};

export default meta;

type Story = StoryObj<typeof Button>;

/*
 *👇 Render functions are a framework specific feature to allow you control on how the component renders.
 * See https://storybook.js.org/docs/react/api/csf
 * to learn how to use render functions.
 */
export const Primary: Story = {
  render: (props) => <Button {...props}></Button>,
  name: 'Button',
  args: {
    children: 'Hello',
    className: 'bg-blue-500 text-white',
    size: 'md',
  },
};

export const Secondary: Story = {
  render: (props) => <Button {...props}></Button>,
  name: 'Button secondary',
  args: {
    // === custom props ===
    children: 'Hello',
    className: 'bg-blue-500 text-white',
    size: 'md',
    variant: 'outline-danger',
    disabled: false,
    loading: false,
  },
};
