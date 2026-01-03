import { render, screen } from '@testing-library/react'
import { expect, test } from 'vitest'
import App from './App'
import React from 'react'

test('renders skeleton message', () => {
  render(<App />)
  const linkElement = screen.getByText(/Tasks App Skeleton/i)
  expect(linkElement).toBeInTheDocument()
})
