//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/BillboardTree" {
Properties {
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "TreeBillboard" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "TreeBillboard" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 30352
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec3 _TreeBillboardCameraRight;
uniform 	vec4 _TreeBillboardCameraUp;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
    u_xlat1.xy = in_TEXCOORD1.xy;
    u_xlat1.z = in_TEXCOORD0.y;
    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlatb0 = 0.0<in_TEXCOORD0.y;
    vs_TEXCOORD0.y = u_xlatb0 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = u_xlat0.w<0.0;
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %57 %189 %199 %200 %206 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %57 Location 57 
                                                      OpMemberDecorate %187 0 BuiltIn 187 
                                                      OpMemberDecorate %187 1 BuiltIn 187 
                                                      OpMemberDecorate %187 2 BuiltIn 187 
                                                      OpDecorate %187 Block 
                                                      OpDecorate %199 Location 199 
                                                      OpDecorate %200 Location 200 
                                                      OpDecorate vs_TEXCOORD0 Location 206 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %12 %7 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_3; f32_4; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 5 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 6 
                                              %44 = OpTypePointer Uniform %6 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                                 Input f32_2* %53 = OpVariable Input 
                                 Input f32_4* %57 = OpVariable Input 
                                          u32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Input %6 
                                          u32 %62 = OpConstant 2 
                                              %65 = OpTypePointer Function %12 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_3 %70 = OpConstantComposite %69 %69 %69 
                                 Private f32* %77 = OpVariable Private 
                                 Private f32* %84 = OpVariable Private 
                                          u32 %85 = OpConstant 3 
                                          i32 %93 = OpConstant 2 
                                         i32 %112 = OpConstant 4 
                                         i32 %119 = OpConstant 3 
                                         i32 %144 = OpConstant 0 
                                         i32 %145 = OpConstant 1 
                                             %186 = OpTypeArray %6 %58 
                                             %187 = OpTypeStruct %7 %6 %186 
                                             %188 = OpTypePointer Output %187 
        Output struct {f32_4; f32; f32[1];}* %189 = OpVariable Output 
                                             %197 = OpTypePointer Output %7 
                               Output f32_4* %199 = OpVariable Output 
                                Input f32_4* %200 = OpVariable Input 
                                             %205 = OpTypePointer Output %51 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                         f32 %208 = OpConstant 3.674022E-40 
                                             %210 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %66 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %45 = OpAccessChain %21 %43 %37 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %37 
                                          f32 %48 = OpLoad %47 
                                         bool %49 = OpFOrdLessThan %46 %48 
                                                      OpStore %42 %49 
                                        f32_2 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %50 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
                                                      OpStore %50 %56 
                                   Input f32* %60 = OpAccessChain %57 %58 
                                          f32 %61 = OpLoad %60 
                                 Private f32* %63 = OpAccessChain %50 %62 
                                                      OpStore %63 %61 
                                         bool %64 = OpLoad %42 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %64 %67 %71 
                                              %67 = OpLabel 
                                                      OpStore %66 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %50 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %66 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %66 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                                 Private f32* %78 = OpAccessChain %9 %58 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                 Private f32* %81 = OpAccessChain %9 %62 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFAdd %80 %82 
                                                      OpStore %77 %83 
                                 Uniform f32* %86 = OpAccessChain %21 %23 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %77 
                                          f32 %89 = OpFMul %87 %88 
                                 Private f32* %90 = OpAccessChain %9 %58 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %89 %91 
                                                      OpStore %84 %92 
                                 Uniform f32* %94 = OpAccessChain %21 %93 %37 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %96 = OpAccessChain %21 %93 %58 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %98 = OpAccessChain %21 %93 %62 
                                          f32 %99 = OpLoad %98 
                                       f32_3 %100 = OpCompositeConstruct %95 %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %11 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %50 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %50 %108 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 0 0 
                                       f32_3 %111 = OpExtInst %1 4 %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFMul %111 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 1 5 6 
                                                      OpStore %9 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpLoad %84 
                                       f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %50 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFAdd %125 %127 
                                       f32_4 %129 = OpLoad %50 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                                      OpStore %50 %130 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                              Uniform f32_4* %133 = OpAccessChain %21 %119 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 3 3 3 
                                       f32_3 %136 = OpFMul %132 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %9 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %142 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %21 %144 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %143 %147 
                                                      OpStore %50 %148 
                              Uniform f32_4* %149 = OpAccessChain %21 %144 %144 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %50 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %50 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %144 %93 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %50 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %9 %162 
                                       f32_4 %163 = OpLoad %9 
                              Uniform f32_4* %164 = OpAccessChain %21 %144 %119 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpFAdd %163 %165 
                                                      OpStore %9 %166 
                                       f32_4 %167 = OpLoad %9 
                                       f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                              Uniform f32_4* %169 = OpAccessChain %21 %145 %145 
                                       f32_4 %170 = OpLoad %169 
                                       f32_4 %171 = OpFMul %168 %170 
                                                      OpStore %50 %171 
                              Uniform f32_4* %172 = OpAccessChain %21 %145 %144 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_4 %175 = OpVectorShuffle %174 %174 0 0 0 0 
                                       f32_4 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %50 
                                       f32_4 %178 = OpFAdd %176 %177 
                                                      OpStore %50 %178 
                              Uniform f32_4* %179 = OpAccessChain %21 %145 %93 
                                       f32_4 %180 = OpLoad %179 
                                       f32_4 %181 = OpLoad %9 
                                       f32_4 %182 = OpVectorShuffle %181 %181 2 2 2 2 
                                       f32_4 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %50 
                                       f32_4 %185 = OpFAdd %183 %184 
                                                      OpStore %50 %185 
                              Uniform f32_4* %190 = OpAccessChain %21 %145 %119 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %50 
                                       f32_4 %196 = OpFAdd %194 %195 
                               Output f32_4* %198 = OpAccessChain %189 %144 
                                                      OpStore %198 %196 
                                       f32_4 %201 = OpLoad %200 
                                                      OpStore %199 %201 
                                  Input f32* %202 = OpAccessChain %57 %58 
                                         f32 %203 = OpLoad %202 
                                        bool %204 = OpFOrdLessThan %69 %203 
                                                      OpStore %42 %204 
                                        bool %207 = OpLoad %42 
                                         f32 %209 = OpSelect %207 %208 %69 
                                 Output f32* %211 = OpAccessChain vs_TEXCOORD0 %58 
                                                      OpStore %211 %209 
                                  Input f32* %212 = OpAccessChain %57 %37 
                                         f32 %213 = OpLoad %212 
                                 Output f32* %214 = OpAccessChain vs_TEXCOORD0 %37 
                                                      OpStore %214 %213 
                                 Output f32* %215 = OpAccessChain %189 %144 %58 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                 Output f32* %218 = OpAccessChain %189 %144 %58 
                                                      OpStore %218 %217 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 63
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %47 %52 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %47 Location 47 
                                             OpDecorate %52 Location 52 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %25 = OpTypeBool 
                                     %26 = OpTypePointer Private %25 
                       Private bool* %27 = OpVariable Private 
                                     %28 = OpTypeInt 32 0 
                                 u32 %29 = OpConstant 3 
                                     %30 = OpTypePointer Private %6 
                                 f32 %33 = OpConstant 3.674022E-40 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                 i32 %38 = OpConstant 1 
                                 i32 %40 = OpConstant -1 
                                     %46 = OpTypePointer Output %7 
                       Output f32_4* %47 = OpVariable Output 
                                     %48 = OpTypeVector %6 3 
                                     %51 = OpTypePointer Input %7 
                        Input f32_4* %52 = OpVariable Input 
                                     %60 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %31 = OpAccessChain %9 %29 
                                 f32 %32 = OpLoad %31 
                                bool %34 = OpFOrdLessThan %32 %33 
                                             OpStore %27 %34 
                                bool %35 = OpLoad %27 
                                 i32 %39 = OpSelect %35 %38 %37 
                                 i32 %41 = OpIMul %39 %40 
                                bool %42 = OpINotEqual %41 %37 
                                             OpSelectionMerge %44 None 
                                             OpBranchConditional %42 %43 %44 
                                     %43 = OpLabel 
                                             OpKill
                                     %44 = OpLabel 
                               f32_4 %49 = OpLoad %9 
                               f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               f32_4 %53 = OpLoad %52 
                               f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               f32_3 %55 = OpFMul %50 %54 
                               f32_4 %56 = OpLoad %47 
                               f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                             OpStore %47 %57 
                        Private f32* %58 = OpAccessChain %9 %29 
                                 f32 %59 = OpLoad %58 
                         Output f32* %61 = OpAccessChain %47 %29 
                                             OpStore %61 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec3 _TreeBillboardCameraRight;
uniform 	vec4 _TreeBillboardCameraUp;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
    u_xlat1.xy = in_TEXCOORD1.xy;
    u_xlat1.z = in_TEXCOORD0.y;
    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_COLOR0 = in_COLOR0;
    u_xlatb0 = 0.0<in_TEXCOORD0.y;
    vs_TEXCOORD0.y = u_xlatb0 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_FogColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb1;
float u_xlat6;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = u_xlat0.w<0.0;
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat0.w;
    u_xlat6 = vs_TEXCOORD1;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 253
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %57 %198 %225 %234 %235 %241 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %57 Location 57 
                                                      OpMemberDecorate %196 0 BuiltIn 196 
                                                      OpMemberDecorate %196 1 BuiltIn 196 
                                                      OpMemberDecorate %196 2 BuiltIn 196 
                                                      OpDecorate %196 Block 
                                                      OpDecorate vs_TEXCOORD1 Location 225 
                                                      OpDecorate %234 Location 234 
                                                      OpDecorate %235 Location 235 
                                                      OpDecorate vs_TEXCOORD0 Location 241 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_3; f32_4; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 8 
                                              %44 = OpTypePointer Uniform %6 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                                 Input f32_2* %53 = OpVariable Input 
                                 Input f32_4* %57 = OpVariable Input 
                                          u32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Input %6 
                                          u32 %62 = OpConstant 2 
                                              %65 = OpTypePointer Function %12 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_3 %70 = OpConstantComposite %69 %69 %69 
                                 Private f32* %77 = OpVariable Private 
                                 Private f32* %84 = OpVariable Private 
                                          u32 %85 = OpConstant 3 
                                          i32 %93 = OpConstant 4 
                                         i32 %112 = OpConstant 6 
                                         i32 %119 = OpConstant 5 
                                         i32 %144 = OpConstant 1 
                                         i32 %148 = OpConstant 0 
                                         i32 %156 = OpConstant 2 
                                         i32 %165 = OpConstant 3 
                                             %195 = OpTypeArray %6 %58 
                                             %196 = OpTypeStruct %7 %6 %195 
                                             %197 = OpTypePointer Output %196 
        Output struct {f32_4; f32; f32[1];}* %198 = OpVariable Output 
                                             %200 = OpTypePointer Output %7 
                                         f32 %211 = OpConstant 3.674022E-40 
                                             %224 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                               Output f32_4* %234 = OpVariable Output 
                                Input f32_4* %235 = OpVariable Input 
                                             %240 = OpTypePointer Output %51 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %66 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %45 = OpAccessChain %21 %43 %37 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %37 
                                          f32 %48 = OpLoad %47 
                                         bool %49 = OpFOrdLessThan %46 %48 
                                                      OpStore %42 %49 
                                        f32_2 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %50 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
                                                      OpStore %50 %56 
                                   Input f32* %60 = OpAccessChain %57 %58 
                                          f32 %61 = OpLoad %60 
                                 Private f32* %63 = OpAccessChain %50 %62 
                                                      OpStore %63 %61 
                                         bool %64 = OpLoad %42 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %64 %67 %71 
                                              %67 = OpLabel 
                                                      OpStore %66 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %50 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %66 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %66 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                                 Private f32* %78 = OpAccessChain %9 %58 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                 Private f32* %81 = OpAccessChain %9 %62 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFAdd %80 %82 
                                                      OpStore %77 %83 
                                 Uniform f32* %86 = OpAccessChain %21 %23 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %77 
                                          f32 %89 = OpFMul %87 %88 
                                 Private f32* %90 = OpAccessChain %9 %58 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %89 %91 
                                                      OpStore %84 %92 
                                 Uniform f32* %94 = OpAccessChain %21 %93 %37 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %96 = OpAccessChain %21 %93 %58 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %98 = OpAccessChain %21 %93 %62 
                                          f32 %99 = OpLoad %98 
                                       f32_3 %100 = OpCompositeConstruct %95 %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %11 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %50 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %50 %108 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 0 0 
                                       f32_3 %111 = OpExtInst %1 4 %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFMul %111 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 1 5 6 
                                                      OpStore %9 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpLoad %84 
                                       f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %50 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFAdd %125 %127 
                                       f32_4 %129 = OpLoad %50 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                                      OpStore %50 %130 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                              Uniform f32_4* %133 = OpAccessChain %21 %119 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 3 3 3 
                                       f32_3 %136 = OpFMul %132 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %9 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %142 1 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %21 %144 %144 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %143 %146 
                                                      OpStore %50 %147 
                              Uniform f32_4* %149 = OpAccessChain %21 %144 %148 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %50 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %50 %155 
                              Uniform f32_4* %157 = OpAccessChain %21 %144 %156 
                                       f32_4 %158 = OpLoad %157 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 2 2 2 2 
                                       f32_4 %161 = OpFMul %158 %160 
                                       f32_4 %162 = OpLoad %50 
                                       f32_4 %163 = OpFAdd %161 %162 
                                                      OpStore %9 %163 
                                       f32_4 %164 = OpLoad %9 
                              Uniform f32_4* %166 = OpAccessChain %21 %144 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_4 %168 = OpFAdd %164 %167 
                                                      OpStore %9 %168 
                                       f32_4 %169 = OpLoad %9 
                                       f32_4 %170 = OpVectorShuffle %169 %169 1 1 1 1 
                              Uniform f32_4* %171 = OpAccessChain %21 %156 %144 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpFMul %170 %172 
                                                      OpStore %50 %173 
                              Uniform f32_4* %174 = OpAccessChain %21 %156 %148 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 0 0 0 
                                       f32_4 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %50 
                                       f32_4 %180 = OpFAdd %178 %179 
                                                      OpStore %50 %180 
                              Uniform f32_4* %181 = OpAccessChain %21 %156 %156 
                                       f32_4 %182 = OpLoad %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %183 2 2 2 2 
                                       f32_4 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %50 
                                       f32_4 %187 = OpFAdd %185 %186 
                                                      OpStore %50 %187 
                              Uniform f32_4* %188 = OpAccessChain %21 %156 %165 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_4 %191 = OpVectorShuffle %190 %190 3 3 3 3 
                                       f32_4 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %50 
                                       f32_4 %194 = OpFAdd %192 %193 
                                                      OpStore %9 %194 
                                       f32_4 %199 = OpLoad %9 
                               Output f32_4* %201 = OpAccessChain %198 %148 
                                                      OpStore %201 %199 
                                Private f32* %202 = OpAccessChain %9 %62 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %21 %148 %58 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFDiv %203 %205 
                                Private f32* %207 = OpAccessChain %9 %37 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %9 %37 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFNegate %209 
                                         f32 %212 = OpFAdd %210 %211 
                                Private f32* %213 = OpAccessChain %9 %37 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %9 %37 
                                         f32 %215 = OpLoad %214 
                                Uniform f32* %216 = OpAccessChain %21 %148 %62 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %215 %217 
                                Private f32* %219 = OpAccessChain %9 %37 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %9 %37 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpExtInst %1 40 %221 %69 
                                Private f32* %223 = OpAccessChain %9 %37 
                                                      OpStore %223 %222 
                                Private f32* %226 = OpAccessChain %9 %37 
                                         f32 %227 = OpLoad %226 
                                Uniform f32* %228 = OpAccessChain %21 %165 %62 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFMul %227 %229 
                                Uniform f32* %231 = OpAccessChain %21 %165 %85 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFAdd %230 %232 
                                                      OpStore vs_TEXCOORD1 %233 
                                       f32_4 %236 = OpLoad %235 
                                                      OpStore %234 %236 
                                  Input f32* %237 = OpAccessChain %57 %58 
                                         f32 %238 = OpLoad %237 
                                        bool %239 = OpFOrdLessThan %69 %238 
                                                      OpStore %42 %239 
                                        bool %242 = OpLoad %42 
                                         f32 %243 = OpSelect %242 %211 %69 
                                 Output f32* %244 = OpAccessChain vs_TEXCOORD0 %58 
                                                      OpStore %244 %243 
                                  Input f32* %245 = OpAccessChain %57 %37 
                                         f32 %246 = OpLoad %245 
                                 Output f32* %247 = OpAccessChain vs_TEXCOORD0 %37 
                                                      OpStore %247 %246 
                                 Output f32* %248 = OpAccessChain %198 %148 %58 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFNegate %249 
                                 Output f32* %251 = OpAccessChain %198 %148 %58 
                                                      OpStore %251 %250 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 90
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %50 %66 %73 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %50 Location 50 
                                             OpMemberDecorate %54 0 Offset 54 
                                             OpDecorate %54 Block 
                                             OpDecorate %56 DescriptorSet 56 
                                             OpDecorate %56 Binding 56 
                                             OpDecorate %66 Location 66 
                                             OpDecorate vs_TEXCOORD1 Location 73 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %25 = OpTypeBool 
                                     %26 = OpTypePointer Private %25 
                       Private bool* %27 = OpVariable Private 
                                     %28 = OpTypeInt 32 0 
                                 u32 %29 = OpConstant 3 
                                     %30 = OpTypePointer Private %6 
                                 f32 %33 = OpConstant 3.674022E-40 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                 i32 %38 = OpConstant 1 
                                 i32 %40 = OpConstant -1 
                                     %46 = OpTypeVector %6 3 
                                     %49 = OpTypePointer Input %7 
                        Input f32_4* %50 = OpVariable Input 
                                     %54 = OpTypeStruct %7 
                                     %55 = OpTypePointer Uniform %54 
            Uniform struct {f32_4;}* %56 = OpVariable Uniform 
                                     %57 = OpTypePointer Uniform %7 
                                     %65 = OpTypePointer Output %7 
                       Output f32_4* %66 = OpVariable Output 
                                     %69 = OpTypePointer Output %6 
                        Private f32* %71 = OpVariable Private 
                                     %72 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %76 = OpConstant 3.674022E-40 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %31 = OpAccessChain %9 %29 
                                 f32 %32 = OpLoad %31 
                                bool %34 = OpFOrdLessThan %32 %33 
                                             OpStore %27 %34 
                                bool %35 = OpLoad %27 
                                 i32 %39 = OpSelect %35 %38 %37 
                                 i32 %41 = OpIMul %39 %40 
                                bool %42 = OpINotEqual %41 %37 
                                             OpSelectionMerge %44 None 
                                             OpBranchConditional %42 %43 %44 
                                     %43 = OpLabel 
                                             OpKill
                                     %44 = OpLabel 
                               f32_4 %47 = OpLoad %9 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                               f32_4 %51 = OpLoad %50 
                               f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                               f32_3 %53 = OpFMul %48 %52 
                      Uniform f32_4* %58 = OpAccessChain %56 %37 
                               f32_4 %59 = OpLoad %58 
                               f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                               f32_3 %61 = OpFNegate %60 
                               f32_3 %62 = OpFAdd %53 %61 
                               f32_4 %63 = OpLoad %9 
                               f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                             OpStore %9 %64 
                        Private f32* %67 = OpAccessChain %9 %29 
                                 f32 %68 = OpLoad %67 
                         Output f32* %70 = OpAccessChain %66 %29 
                                             OpStore %70 %68 
                                 f32 %74 = OpLoad vs_TEXCOORD1 
                                             OpStore %71 %74 
                                 f32 %75 = OpLoad %71 
                                 f32 %77 = OpExtInst %1 43 %75 %33 %76 
                                             OpStore %71 %77 
                                 f32 %78 = OpLoad %71 
                               f32_3 %79 = OpCompositeConstruct %78 %78 %78 
                               f32_4 %80 = OpLoad %9 
                               f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                               f32_3 %82 = OpFMul %79 %81 
                      Uniform f32_4* %83 = OpAccessChain %56 %37 
                               f32_4 %84 = OpLoad %83 
                               f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               f32_3 %86 = OpFAdd %82 %85 
                               f32_4 %87 = OpLoad %66 
                               f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                             OpStore %66 %88 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
""
}
}
}
}
}