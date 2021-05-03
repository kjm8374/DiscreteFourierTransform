function [m_ctr,cm_ctr,yy] = fft_ifft(t,y,N)
  % NOTE: Matlab fft() returns the spectral density function F(m)
  %         Dividing by N changes F(m) to the Euler phasors cm.
  %         Although cm is more common, F(m) saves time by not dividing by N.
  %       Matlab ifft() multiply by N before using IFFT.
  m_ctr=-N/2:N/2-1;
  cm_ctr = fftshift(fft(y,N)/N);
  T = 6;
  ang_freq = m_ctr*2*pi/T;
  make_stem(ang_freq,abs(cm_ctr),'shifted spectrum','m(ctr)','abs(cm)');
 
  % Reconstruct y (called yy) using inverse FFT (IFFT).
  yy = real(ifft(N*fftshift(cm_ctr))); % real function scrubs imaginary vestiges
  make_plot(t,yy,'Reconstructed Waveforms','seconds','reconstructed y');
end
