function [m_ctr,cm_ctr,yy] = fft_hanning_ifft(t,y,N,Mwin)
  % NOTE: Matlab fft() returns the spectral density function F(m)
  %         Dividing by N changes F(m) to the Euler phasors cm.
  %         Although cm is more common, F(m) saves time by not dividing by N.
  %       Matlab ifft() multiply by N before using IFFT.
  m_ctr=-N/2:N/2-1;
  cm_ctr = fftshift(fft(y,N)/N);
  make_stem(m_ctr,abs(cm_ctr),'shifted spectrum','m(ctr)','abs(cm)');
  win=zeros(size(cm_ctr));
  ind1 = find(m_ctr >= -Mwin & m_ctr<= Mwin);
  win(ind1) = hanning(2*Mwin+1);
  cm_ctr_win= cm_ctr.*win;
  % Reconstruct y (called yy) using inverse FFT (IFFT).
  yy = real(ifft(N*fftshift(cm_ctr_win))); % real function scrubs imaginary vestiges
  make_plot(t,yy,'Reconstructed Waveforms','seconds','reconstructed y');
end
