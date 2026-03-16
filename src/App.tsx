import { useRef } from 'react';
import { motion, useScroll, useTransform } from 'framer-motion';
import Hero from './sections/Hero';
import UseCases from './sections/UseCases';
import ContactForm from './sections/ContactForm';
import Team from './sections/Team';
import Pricing from './sections/Pricing';
import Footer from './sections/Footer';
import Navigation from './sections/Navigation';

function App() {
  const containerRef = useRef<HTMLDivElement>(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  });

  const backgroundY = useTransform(scrollYProgress, [0, 1], ["0%", "30%"]);

  return (
    <div ref={containerRef} className="relative min-h-screen bg-background overflow-x-hidden">
      {/* Animated background */}
      <motion.div 
        className="fixed inset-0 grid-bg pointer-events-none z-0"
        style={{ y: backgroundY }}
      />
      
      {/* Gradient orbs */}
      <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
        <motion.div 
          className="absolute top-[-20%] left-[-10%] w-[600px] h-[600px] rounded-full"
          style={{
            background: 'radial-gradient(circle, hsl(180 100% 50% / 0.15) 0%, transparent 70%)',
          }}
          animate={{
            x: [0, 50, 0],
            y: [0, 30, 0],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            ease: "easeInOut"
          }}
        />
        <motion.div 
          className="absolute bottom-[-20%] right-[-10%] w-[500px] h-[500px] rounded-full"
          style={{
            background: 'radial-gradient(circle, hsl(320 100% 50% / 0.15) 0%, transparent 70%)',
          }}
          animate={{
            x: [0, -40, 0],
            y: [0, -50, 0],
          }}
          transition={{
            duration: 10,
            repeat: Infinity,
            ease: "easeInOut"
          }}
        />
      </div>

      {/* Navigation */}
      <Navigation />

      {/* Main content */}
      <main className="relative z-10">
        <Hero />
        <UseCases />
        <Pricing />
        <Team />
        <ContactForm />
        <Footer />
      </main>
    </div>
  );
}

export default App;
